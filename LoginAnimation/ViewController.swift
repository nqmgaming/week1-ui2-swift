import UIKit

class ViewController: UIViewController {

    let disconnectedImage = UIImageView()
    let buttonSignInAnimation = UIView()
    let titleLogin = UILabel()
    let imageLogin = UIImageView()
    let signInContainer = UIView()
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let signInButton = UIButton()
    let signInButtonMain = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        setUpDisconnectImage()
        setUpButtonSignInAnimation()
        setUpImageLogin()
        setUpTitleLogin()
        setUpSignInButton()
        setUpSignInContainer()
        setUpEmailLabel()
        setUpEmailTextField()
        setUpPasswordLabel()
        setUpPasswordTextField()
        setUpSignInButtonMain()
        
        signInContainer.alpha = 0
    }

    private func setUpDisconnectImage() {
        disconnectedImage.image = UIImage(named: "icloud-cancel")
        disconnectedImage.contentMode = .scaleAspectFit
        disconnectedImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(disconnectedImage)

        NSLayoutConstraint.activate([
            disconnectedImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            disconnectedImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            disconnectedImage.widthAnchor.constraint(equalToConstant: 50),
            disconnectedImage.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setUpButtonSignInAnimation() {
        buttonSignInAnimation.backgroundColor = .white
        buttonSignInAnimation.layer.cornerRadius = 10
        buttonSignInAnimation.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonSignInAnimation)

        NSLayoutConstraint.activate([
            buttonSignInAnimation.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            buttonSignInAnimation.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonSignInAnimation.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonSignInAnimation.heightAnchor.constraint(equalToConstant: 85)
        ])
    }

    private func setUpImageLogin() {
        imageLogin.image = UIImage(named: "cloudy-day")
        imageLogin.contentMode = .scaleAspectFit
        imageLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonSignInAnimation.addSubview(imageLogin)

        NSLayoutConstraint.activate([
            imageLogin.topAnchor.constraint(equalTo: buttonSignInAnimation.topAnchor, constant: 5),
            imageLogin.leadingAnchor.constraint(equalTo: buttonSignInAnimation.leadingAnchor, constant: 20),
            imageLogin.bottomAnchor.constraint(equalTo: buttonSignInAnimation.bottomAnchor, constant: -5),
            imageLogin.widthAnchor.constraint(equalToConstant: 60),
            imageLogin.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    private func setUpTitleLogin() {
        titleLogin.text = "Sign In"
        titleLogin.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLogin.textColor = .main
        titleLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonSignInAnimation.addSubview(titleLogin)

        NSLayoutConstraint.activate([
            titleLogin.leadingAnchor.constraint(equalTo: imageLogin.trailingAnchor, constant: 20),
            titleLogin.centerYAnchor.constraint(equalTo: imageLogin.centerYAnchor)
        ])
    }

    private func setUpSignInButton() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.backgroundColor = .clear
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        buttonSignInAnimation.addSubview(signInButton)

        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: buttonSignInAnimation.topAnchor),
            signInButton.leadingAnchor.constraint(equalTo: buttonSignInAnimation.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: buttonSignInAnimation.trailingAnchor),
            signInButton.bottomAnchor.constraint(equalTo: buttonSignInAnimation.bottomAnchor)
        ])
    }

    @objc private func signInButtonTapped() {
        print("Sign In button tapped")

        UIView.animate(withDuration: 0.5, animations: {
            // Di chuyển buttonSignInAnimation lên trên và giảm chiều cao xuống 70%
            self.buttonSignInAnimation.transform = CGAffineTransform(translationX: 0, y: -150).scaledBy(x: 1, y: 0.7)
            // Di chuyển signInContainer theo buttonSignInAnimation
            self.signInContainer.transform = CGAffineTransform(translationX: 0, y: -160)
            // Giảm kích thước của imageLogin xuống 70%
            self.imageLogin.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            // Giảm kích thước của titleLogin xuống 70%
            self.titleLogin.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            // Điều chỉnh lại vị trí của titleLogin để duy trì khoảng cách
            self.titleLogin.frame.origin.x = self.imageLogin.frame.maxX + 10
            self.titleLogin.center.y = self.imageLogin.center.y
            // Hiển thị signInContainer
            self.signInContainer.alpha = 1
        })
    }

    private func setUpSignInContainer() {
        signInContainer.backgroundColor = .second
        signInContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInContainer)

        NSLayoutConstraint.activate([
            signInContainer.topAnchor.constraint(equalTo: buttonSignInAnimation.bottomAnchor),
            signInContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signInContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            signInContainer.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)
        ])
    }

    private func setUpEmailLabel() {
        emailLabel.text = "Email"
        emailLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        emailLabel.textColor = .main
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        signInContainer.addSubview(emailLabel)

        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: signInContainer.topAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: signInContainer.leadingAnchor, constant: 20)
        ])
    }

    private func setUpEmailTextField() {
        emailTextField.placeholder = "Enter your email"
        emailTextField.font = UIFont.systemFont(ofSize: 16)
        emailTextField.textColor = .main
        emailTextField.textContentType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.spellCheckingType = .no
        emailTextField.keyboardType = .emailAddress
        emailTextField.returnKeyType = .next
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        signInContainer.addSubview(emailTextField)

        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: signInContainer.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: signInContainer.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func setUpPasswordLabel() {
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        passwordLabel.textColor = .main
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        signInContainer.addSubview(passwordLabel)

        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: signInContainer.leadingAnchor, constant: 20)
        ])
    }

    private func setUpPasswordTextField() {
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.textColor = .main
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .password
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.spellCheckingType = .no
        passwordTextField.keyboardType = .default
        passwordTextField.returnKeyType = .done
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        signInContainer.addSubview(passwordTextField)

        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: signInContainer.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: signInContainer.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func setUpSignInButtonMain() {
        signInButtonMain.setTitle("Sign In", for: .normal)
        signInButtonMain.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        signInButtonMain.backgroundColor = .main
        signInButtonMain.layer.cornerRadius = 10
        signInButtonMain.translatesAutoresizingMaskIntoConstraints = false
        signInButtonMain.addTarget(self, action: #selector(signInButtonMainTapped), for: .touchUpInside)
        signInContainer.addSubview(signInButtonMain)

        NSLayoutConstraint.activate([
            signInButtonMain.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            signInButtonMain.leadingAnchor.constraint(equalTo: signInContainer.leadingAnchor, constant: 20),
            signInButtonMain.trailingAnchor.constraint(equalTo: signInContainer.trailingAnchor, constant: -20),
            signInButtonMain.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc private func signInButtonMainTapped() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)

        if email.isEmpty || password.isEmpty {
            alert.title = "Error"
            alert.message = "Please enter email and password"
        } else {
            alert.title = "Success"
            alert.message = "Sign in successfully"
        }

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
