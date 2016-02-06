class Admin::SettingsController < ApplicationController
  def index
    @preference = Preference.first_or_create(song_sort_order: "DESC", artist_sort_order: "DESC")
  end

  def update
    @preference = Preference.find(params[:id])
    @preference.update(pref_settings_params)
    redirect_to admin_settings_index_path
  end

  def pref_settings_params
    params.require(:preference).permit(:song_sort_order, :artist_sort_order)
  end
end
