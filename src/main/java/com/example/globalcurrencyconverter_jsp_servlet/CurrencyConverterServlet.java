package com.example.globalcurrencyconverter_jsp_servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/convert")
public class CurrencyConverterServlet extends HttpServlet {
    private static final Map<String, Double> exchangeRates = new HashMap<>();

    static {
        exchangeRates.put("USD", 1.0);
        exchangeRates.put("EUR", 0.85);
        exchangeRates.put("GBP", 0.75);
        exchangeRates.put("AUD", 1.35);
        exchangeRates.put("CAD", 1.25);
        exchangeRates.put("CHF", 0.92);
        exchangeRates.put("CNY", 6.47);
        exchangeRates.put("JPY", 110.0);
        exchangeRates.put("INR", 73.0);
        exchangeRates.put("RUB", 72.0);
        exchangeRates.put("ZAR", 14.0);
        exchangeRates.put("NZD", 1.42);
        exchangeRates.put("SGD", 1.34);
        exchangeRates.put("HKD", 7.75);
        exchangeRates.put("NOK", 8.5);
        exchangeRates.put("SEK", 8.7);
        exchangeRates.put("MXN", 20.0);
        exchangeRates.put("BRL", 5.2);
        exchangeRates.put("TRY", 34.22);
        exchangeRates.put("AZN", 1.7);
        exchangeRates.put("AED", 3.67);
        exchangeRates.put("THB", 32.0);
        exchangeRates.put("MYR", 4.2);
        exchangeRates.put("PHP", 50.0);
        exchangeRates.put("IDR", 14400.0);
        exchangeRates.put("PKR", 150.0);
        exchangeRates.put("CZK", 21.0);
        exchangeRates.put("HUF", 300.0);
        exchangeRates.put("ILS", 3.3);
        exchangeRates.put("DZD", 145.0);
        exchangeRates.put("MAD", 9.0);
        exchangeRates.put("COP", 3700.0);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            double amount = Double.parseDouble(request.getParameter("amount"));
            String fromCurrency = request.getParameter("fromCurrency");
            String toCurrency = request.getParameter("toCurrency");

            if (exchangeRates.containsKey(fromCurrency) && exchangeRates.containsKey(toCurrency)) {
                double fromRate = exchangeRates.get(fromCurrency);
                double toRate = exchangeRates.get(toCurrency);
                double convertedAmount = amount * (toRate / fromRate);

                request.setAttribute("convertedAmount", convertedAmount);
                request.setAttribute("toCurrency", toCurrency);
            } else {
                request.setAttribute("errorMessage", "Invalid currency selection.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid amount. Please enter a numeric value.");
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
