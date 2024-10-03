<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.3);
            max-width: 400px;
            width: 100%;
        }

        h1 {
            text-align: center;
            font-size: 32px;
            margin-bottom: 20px;
            color: #ffffff;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
            color: #e0e0e0;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            color: #333;
            background-color: #f3f3f3;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-group input:focus, .form-group select:focus {
            outline: none;
            box-shadow: 0 0 10px #6a11cb;
        }

        .submit-button {
            background: linear-gradient(90deg, #ff8a00, #e52e71);
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s ease;
            margin-top: 10px;
        }

        .submit-button:hover {
            background: linear-gradient(90deg, #e52e71, #ff8a00);
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
        }

        .result {
            margin-top: 20px;
            padding: 15px;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            text-align: center;
        }

        .result h3 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #ffffff;
        }

        .result p {
            font-size: 18px;
            color: #ffffff;
        }

        .error-message {
            color: #ff8a00;
            font-size: 14px;
            margin-bottom: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Currency Converter</h1>

    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
    <div class="error-message">
        <%= errorMessage %>
    </div>
    <%
        }
    %>

    <form action="convert" method="post">
        <div class="form-group">
            <label for="amount">Amount:</label>
            <input type="text" id="amount" name="amount" required placeholder="Enter amount">
        </div>
        <div class="form-group">
            <label for="fromCurrency">From Currency:</label>
            <select id="fromCurrency" name="fromCurrency" required>
                <option value="" disabled selected>Select currency</option>
                <option value="USD">USD - United States Dollar</option>
                <option value="EUR">EUR - Euro</option>
                <option value="GBP">GBP - British Pound</option>
                <option value="AUD">AUD - Australian Dollar</option>
                <option value="CAD">CAD - Canadian Dollar</option>
                <option value="CHF">CHF - Swiss Franc</option>
                <option value="CNY">CNY - Chinese Yuan</option>
                <option value="JPY">JPY - Japanese Yen</option>
                <option value="INR">INR - Indian Rupee</option>
                <option value="RUB">RUB - Russian Ruble</option>
                <option value="ZAR">ZAR - South African Rand</option>
                <option value="NZD">NZD - New Zealand Dollar</option>
                <option value="SGD">SGD - Singapore Dollar</option>
                <option value="HKD">HKD - Hong Kong Dollar</option>
                <option value="NOK">NOK - Norwegian Krone</option>
                <option value="SEK">SEK - Swedish Krona</option>
                <option value="MXN">MXN - Mexican Peso</option>
                <option value="BRL">BRL - Brazilian Real</option>
                <option value="TRY">TRY - Turkish Lira</option>
                <option value="AZN">AZN - Azerbaijani Manat</option>
                <option value="AED">AED - United Arab Emirates Dirham</option>
                <option value="THB">THB - Thai Baht</option>
                <option value="MYR">MYR - Malaysian Ringgit</option>
                <option value="PHP">PHP - Philippine Peso</option>
                <option value="IDR">IDR - Indonesian Rupiah</option>
                <option value="PKR">PKR - Pakistani Rupee</option>
                <option value="CZK">CZK - Czech Koruna</option>
                <option value="HUF">HUF - Hungarian Forint</option>
                <option value="ILS">ILS - Israeli New Shekel</option>
                <option value="DZD">DZD - Algerian Dinar</option>
                <option value="MAD">MAD - Moroccan Dirham</option>
                <option value="COP">COP - Colombian Peso</option>
            </select>
        </div>
        <div class="form-group">
            <label for="toCurrency">To Currency:</label>
            <select id="toCurrency" name="toCurrency" required>
                <option value="" disabled selected>Select currency</option>
                <option value="USD">USD - United States Dollar</option>
                <option value="EUR">EUR - Euro</option>
                <option value="GBP">GBP - British Pound</option>
                <option value="AUD">AUD - Australian Dollar</option>
                <option value="CAD">CAD - Canadian Dollar</option>
                <option value="CHF">CHF - Swiss Franc</option>
                <option value="CNY">CNY - Chinese Yuan</option>
                <option value="JPY">JPY - Japanese Yen</option>
                <option value="INR">INR - Indian Rupee</option>
                <option value="RUB">RUB - Russian Ruble</option>
                <option value="ZAR">ZAR - South African Rand</option>
                <option value="NZD">NZD - New Zealand Dollar</option>
                <option value="SGD">SGD - Singapore Dollar</option>
                <option value="HKD">HKD - Hong Kong Dollar</option>
                <option value="NOK">NOK - Norwegian Krone</option>
                <option value="SEK">SEK - Swedish Krona</option>
                <option value="MXN">MXN - Mexican Peso</option>
                <option value="BRL">BRL - Brazilian Real</option>
                <option value="TRY">TRY - Turkish Lira</option>
                <option value="AZN">AZN - Azerbaijani Manat</option>
                <option value="AED">AED - United Arab Emirates Dirham</option>
                <option value="THB">THB - Thai Baht</option>
                <option value="MYR">MYR - Malaysian Ringgit</option>
                <option value="PHP">PHP - Philippine Peso</option>
                <option value="IDR">IDR - Indonesian Rupiah</option>
                <option value="PKR">PKR - Pakistani Rupee</option>
                <option value="CZK">CZK - Czech Koruna</option>
                <option value="HUF">HUF - Hungarian Forint</option>
                <option value="ILS">ILS - Israeli New Shekel</option>
                <option value="DZD">DZD - Algerian Dinar</option>
                <option value="MAD">MAD - Moroccan Dirham</option>
                <option value="COP">COP - Colombian Peso</option>
            </select>
        </div>
        <div class="form-group">
            <input type="submit" value="Convert" class="submit-button">
        </div>
    </form>

    <%
        Double convertedAmount = (Double) request.getAttribute("convertedAmount");
        if (convertedAmount != null) {
    %>
    <div class="result">
        <h3>Converted Amount</h3>
        <p><%= convertedAmount %> <%= request.getAttribute("toCurrency") %></p>
    </div>
    <%
        }
    %>
</div>
</body>
</html>
