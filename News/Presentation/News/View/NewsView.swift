//
//  NewsView.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation
import UIKit

class NewsView: BaseView {
    
    private var newsCell = String(describing: NewsCell.self)
    private var newsHeaderView = String(describing: NewsHeaderView.self)
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(NewsCell.self, forCellReuseIdentifier: newsCell)
        tableView.register(NewsHeaderView.self, forHeaderFooterViewReuseIdentifier: newsHeaderView)
        tableView.backgroundColor = .hex1d1c21
        return tableView
    }()
    
    var article: [Article] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var itemHandler: ((String) -> ())?
    
    override func setup() {
        super.setup()
        addSubview(tableView)
        tableView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor)
    }
}

extension NewsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        article.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: newsCell) as! NewsCell
        cell.updateCell(news: article[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = article[indexPath.row].url {
            itemHandler?(url)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: newsHeaderView) as! NewsHeaderView
        header.contentView.backgroundColor = .hex1d1c21
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y > 0) {
        }
    }
    
}


class NewsHeaderView: UITableViewHeaderFooterView {

    let headerLabel = Label(text: "Top News ", font: .helveticaNeueBold(size: 13), textColor: .white, alignment: .center)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        addSubview(headerLabel)
        headerLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
}

class NewsCell: BaseTableViewCell {
    
    let imgView: UIImageView = {
        let img = UIImageView(image: UIImage(named: ""))
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .hex1d1c21
        //img.roundCorners([.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 13)
        img.clipsToBounds = true
        return img
    }()
    
    let titleLabel: Label = {
        let label = Label(text: "Title", font: .helveticaNeueBold(size: 16), textColor: .white)
        return label
    }()
    
    let authorLabel: Label = {
        let label = Label(text: "Author", font: .helveticaNeueRegular(size: 14), textColor: .white.withAlphaComponent(0.8))
        return label
    }()
    
    override func setup() {
        super.setup()
        addSubviews(imgView, authorLabel, titleLabel)
        imgView.fillUpSuperview(margin: .bottomOnly(0))
        
        authorLabel.anchor(leading: leadingAnchor, bottom: imgView.bottomAnchor, trailing: trailingAnchor, margin: .init(top: 0, left: 15, bottom: 20, right: 15))
        
        titleLabel.anchor(leading: leadingAnchor, bottom: authorLabel.topAnchor, trailing: trailingAnchor, margin: .init(top: 0, left: 15, bottom: 10, right: 15))
    }
    
    func updateCell(news: Article) {
        imgView.showImage(url: news.urlToImage ?? "")
        titleLabel.text = news.title ?? "Not found"
        authorLabel.text = news.author ?? "Not found"
    }
}
