//
//  BaseView.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import UIKit

class BaseView: UIView {
    
    func setup(){
        if #available(iOS 13.0, *) {
            backgroundColor = .systemBackground
        } else {
            backgroundColor = .white
        }
    }

    func layout() {}
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BaseTableViewCell: UITableViewCell,
                              UITextFieldDelegate {
    func setup(){
        selectionStyle = .none
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

import RxSwift
class BaseController<SubView: UIView>: UIViewController {
    
    let _view: SubView
    let disposeBag = DisposeBag()
    private let activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView.init(style: .large)
        activity.startAnimating()
        activity.color = .white
        return activity
    }()
    
    private let loaderContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        return view
    }()
    
    init(view: SubView = SubView()) {
        self._view = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = _view
        view.clipsToBounds = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func showToastWithTItle(_ title: String?, type: ToastType, duration: TimeInterval = 1.0) {
        Toast.shared.showToastWithTItle(title ?? "Unable to complete this process, please try again", type: type, duration: duration)
    }
    
    func showLoader() {
        guard let keyWindow = UIWindow.keyWindow else { return }
        keyWindow.addSubview(loaderContainer)
        loaderContainer.anchor(top: keyWindow.topAnchor, leading: keyWindow.leadingAnchor, bottom: keyWindow.bottomAnchor, trailing: keyWindow.trailingAnchor)
        keyWindow.bringSubviewToFront(loaderContainer)

        loaderContainer.addSubview(activity)
        activity.placeAtCenterOf(centerY: loaderContainer.centerYAnchor, centerX: loaderContainer.centerXAnchor)
    }
    
    func removeLoader() {
        loaderContainer.removeFromSuperview()
    }
    
    func setNavbar() {
        let titleLabel = Label(text: "Newsfeed", font: .helveticaNeueBold(size: 18), textColor: .white)
        let titleNavItem = UIBarButtonItem.init(customView: titleLabel)
        navigationItem.setLeftBarButton(titleNavItem, animated: true)
        navigationController?.navigationBar.backgroundColor = .hex23232b
        navigationController?.navigationBar.tintColor = .hex23232b
        navigationController?.navigationBar.barTintColor = .hex23232b
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
       
        setupStatusBar()
    }
    
    func setNavbar(tintColor: UIColor) {
        navigationController?.navigationBar.tintColor = tintColor
        setupStatusBar()
    }
    
    func setupStatusBar() {
        if #available(iOS 13.0, *) {
            let statusBarHeight: CGFloat = UIWindow.keyWindow?.windowScene?.statusBarManager?.statusBarFrame.size.height ?? 0
            
            let statusbarView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: statusBarHeight))
            statusbarView.backgroundColor = .hex23232b
            view.addSubview(statusbarView)
            
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = .hex23232b
        }
    }
}
