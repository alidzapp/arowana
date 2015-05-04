class PastesController < InheritedResources::Base
  before_action :set_pastes
  before_action :set_paste, only: [:show, :edit, :update, :destroy]

  def new
    @paste = current_user.pastes.build
  end

  def create
    @paste = current_user.pastes.build(paste_params)

    if @paste.save
      redirect_to new_paste_path, flash: { success: 'Paste was successfully created.' }
    else
      render 'new'
    end
  end

  private

  def paste_params
    params.require(:paste).permit([:name, :body, :expires_at, :language])
  end

  def set_pastes
    @pastes = Paste.order(:created_at).page params[:page]
  end

  def set_paste
    @paste = Paste.find(params[:id])
  end
end

