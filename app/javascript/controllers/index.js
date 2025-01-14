// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import CartController from "./cart_controller"
application.register("cart", CartController)

import DiscountController from "./discount_controller"
application.register("discount", DiscountController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)
