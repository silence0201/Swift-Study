


//定义一个Blog(博客)结构体
struct Blog {
    let name: String?
    let URL: String?
    let Author: String?
}

func guardStyleBlog(blog: Blog) {
    
    guard let blogName = blog.name,
        let blogURL = blog.URL,
        let blogAuthor = blog.Author else {
        
        print("这篇博客信息不完整!")
        return
    }
    
    print("这篇博客名：\(blogName)")
    print("这篇博客由\(blogAuthor)写的")
    print("这篇博客网址：\(blogURL)")

}

let blog1 = Blog(name: nil, URL: "51work6.com", Author: "Tom")
let blog2 = Blog(name: "Tony'Blog", URL: "51work6.com", Author: "Tony")

print("--blog1--")
guardStyleBlog(blog: blog1)
print("--blog2--")
guardStyleBlog(blog: blog2)
