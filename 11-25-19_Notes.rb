Apartment App

- make home screen however you like
- make 1 single type of login, presumption being user owns/manages a bunch and can edit their listings

- pages
    - home
    - login
        - username & pw & submit
    - log out page or log out link?
    - add apt
        - think about schema
        - address
            - is user logged in / authenticated?
        - contact info
    - apt show page
        - img
        - info
        - could add edit button depending on if user is logged in

resources to use
    - https://github.com/learn-academy-2019-delta/exercise-apartment-app
    - https://github.com/learn-academy-2019-echo/Syllabus/tree/master/React_in_Rails_Apartment_App

def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
    
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
end

tells devise to add strong params of name, email, password