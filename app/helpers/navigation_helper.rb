module NavigationHelper
    def collaps_links_partial_path
        if user_signed_in?
            'layouts/navigation/collaps_bar/signed_in_links'
        else
            'layouts/navigation/collaps_bar/no_sign_in_links'
        end
    end
end