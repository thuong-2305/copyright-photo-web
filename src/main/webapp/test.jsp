<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/15/2025
  Time: 3:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css"
    />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f5;
        }

        .btn {
            /* Fix nếu btn là tag div */
            display: inline-block;
            /* Fix nếu btn là tag a */
            text-decoration: none;
            /* Fix nếu btn là tag button */
            background-color: transparent;
            border: none;
            outline: none;
            /* Chung */
            padding: 12px 48px;
            min-width: 120px;
            color: #fff;
            border-radius: 50px;
            cursor: pointer;
            transition: opacity 0.3s ease;
        }

        .btn:hover {
            opacity: 0.8;
        }

        .btn--success {
            background-color: #05f745;
        }
        .btn--warm {
            background-color: #0c64e8;
        }
        .btn--danger {
            background-color: #e01010;
        }

        .btn + .btn {
            margin-left: 16px;
        }

        .btn--small {
            padding: 8px 24px;
            min-width: 80px;
        }

        .btn--large {
            padding: 16px 64px;
            min-width: 160px;
        }

        .btn--block {
            display: block;
            width: 100%;
        }

        .btn--disabled,
        .btn[disabled] {
            opacity: 0.5 !important;
            pointer-events: none;
        }

        #toast {
            position: fixed;
            top: 32px;
            right: 32px;
            z-index: 9999;
        }

        .toast {
            padding: 20px 0;
            min-width: 400px;
            max-width: 460px;
            display: flex;
            flex-direction: row;
            align-items: center;
            border-left: 4px solid #ccc;
            border-radius: 4px;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        @keyframes SlideInLeft {
            from {
                opacity: 0;
                transform: translateX(calc(100% + 32px));
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @keyframes fadeOut {
            to {
                opacity: 0;
            }
        }
        .toast + .toast {
            margin-top: 24px;
        }

        .toast__icon,
        .toast__close {
            padding: 0 20px;
        }

        .toast__icon {
            font-size: 24px;
            color: #ccc;
        }

        .toast__close {
            font-size: 20px;
            color: rgba(0, 0, 0, 0.3);
            cursor: pointer;
        }

        .toast__body {
            flex: 1;
        }

        .toast__title {
            font-size: 16px;
            font-weight: 600;
            color: #333;
        }

        .toast__message {
            font-size: 14px;
            color: #666;
            margin-top: 4px;
        }

        .toast--success {
            border-left-color: #05f745;
        }

        .toast--success .toast__icon {
            color: #05f745;
        }

        .toast--info {
            border-left-color: #0c64e8;
        }

        .toast--info .toast__icon {
            color: #0c64e8;
        }
        .toast--warning {
            border-left-color: #e01010;
        }

        .toast--warning .toast__icon {
            color: #e01010;
        }
    </style>
</head>
<body>
<div id="toast"></div>

<div onclick="showSuccessToast()" class="btn btn--success">Success</div>
<div onclick="showErrorToast()" class="btn btn--warm">Warning</div>

<script src="./assets/js/admin-products.js"></script>
</body>
</html>

