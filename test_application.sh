rootPath=$(git rev-parse --show-toplevel)

test_modules() {
    cd $1
    flutter test --coverage 
}

test_modules "$rootPath/modules/feature/faq" 
test_modules "$rootPath/modules/feature/splash_screen" 