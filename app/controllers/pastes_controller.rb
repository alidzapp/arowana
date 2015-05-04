class PastesController < InheritedResources::Base
  before_action :set_pastes
  before_action :set_paste, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!, except: :api

  protect_from_forgery except: :api

  def show
    @comment = current_user.comments.build
  end

  def new
    @paste = current_user.pastes.build
  end

  def api
    begin
      @user = User.find_by! api_key: params[:api_key]
    rescue ActiveRecord::RecordNotFound
      head :bad_request
    end

    new_paste = @user.pastes.build
    new_paste.body_from_file(params[:file])

    begin
      new_paste.save!
      head 200
    rescue ActiveRecord::RecordInvalid
      head :bad_request
    end
  end

  def create
    @paste = current_user.pastes.build(paste_params)

    if @paste.save
      redirect_to new_paste_path, flash: { success: 'Paste was successfully created.' }
    else
      render 'new'
    end
  end

  def update
    if @paste.update(paste_params)
      redirect_to paste_path(@paste), flash: { success: 'Paste was successfully updated.' }
    else
      redirect_to paste_path(@paste), flash: { warning: 'Unable to update paste.' }
    end
  end

  private

  def paste_params
    params.require(:paste).permit([:name, :body, :expires_at, :language])
  end

  def set_pastes
    @pastes = Paste.order(:created_at).unexpired.page params[:page]
  end

  def set_paste
    begin
      @paste = Paste.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to pastes_path
    end
  end
end

