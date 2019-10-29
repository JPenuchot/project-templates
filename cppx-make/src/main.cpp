
//====================================================================
// Library code: implementing the macros (once)

#include <memory>
#include <type_traits>

#include <experimental/meta>
#include <experimental/compiler>

// Clonable types have:
//  - a virtual clone() that returns unique_ptr<X> where X is the type that first introduces it
//
#define CLONABLE_BASE(Base) \
    virtual std::unique_ptr<Base> clone() const { \
        return std::unique_ptr<Base>(new Base(*this));  \
    }

#define CLONABLE(Base) \
    std::unique_ptr<Base> clone() const override { \
        using Self = std::remove_cv_t<std::remove_reference_t<decltype(*this)>>; \
        return std::unique_ptr<Self>(new Self(*this));  \
    }


//====================================================================
// User code: using the macros to write our own types (many times)

#include <iostream>

class B {
    int bdata;
public:
    CLONABLE_BASE(B)
    virtual void print() const { std::cout << "B"; }
};

class C : public B {
    int cdata;
public:
    CLONABLE(B)
    void print() const override { std::cout << "C"; }
};

class D : public C {
    int ddata;
public:
    CLONABLE(B)
    void print() const override { std::cout << "D"; }
};

int main() {
    std::shared_ptr<B> b1 = std::make_shared<D>();
    std::shared_ptr<B> b2 = b1->clone();
    b2->print();
}


//====================================================================
// Display the generated code

consteval {
    using namespace std::experimental::meta;
    compiler.print(reflexpr(B));
    compiler.print("");
    compiler.print(reflexpr(C));
    compiler.print("");
    compiler.print(reflexpr(D));
}
