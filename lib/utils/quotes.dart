import 'dart:async';

import 'package:abdulla_nasar_portfolio/utils/reusable_widget.dart';
import 'package:flutter/material.dart';

List<String> quotes = [
  "The only way to do great work is to love what you do. - Steve Jobs",
  "In three words I can sum up everything I've learned about life: it goes on. - Robert Frost",
  "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
  "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
  "Do not wait to strike till the iron is hot, but make it hot by striking. - William Butler Yeats",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "In the middle of every difficulty lies opportunity. - Albert Einstein",
  "It does not matter how slowly you go, as long as you do not stop. - Confucius",
  "It always seems impossible until it's done. - Nelson Mandela",
  "Life is what happens when you're busy making other plans. - Allen Sanders",
  "Don't count the days, make the days count. - Muhammad Ali",
  "The only person you are destined to become is the person you decide to be. - Ralph Waldo Emerson",
  "The best way to predict the future is to create it. - Peter Drucker",
  "Strive not to be a success, but rather to be of value. - Albert Einstein",
  "It's not the years in your life that count, it's the life in your years. - Abraham Lincoln",
  "The purpose of our lives is to be happy. - Dalai Lama",
  "Success is stumbling from failure to failure with no loss of enthusiasm. - Winston S. Churchill",
  "If you want to achieve greatness stop asking for permission. - Anonymous",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "If you are not willing to risk the usual, you will have to settle for the ordinary. - Jim Rohn",
  "The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack in will. - Vince Lombardi",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "If you really look closely, most overnight successes took a long time. - Steve Jobs",
  "You have within you right now, everything you need to deal with whatever the world can throw at you. - Brian Tracy",
  "You only live once, but if you do it right, once is enough. - Mae West",
  "The best way to predict the future is to invent it. - Alan Kay",
  "The secret to getting ahead is getting started. - Mark Twain",
  "Do not wait to strike till the iron is hot, but make it hot by striking. - William Butler Yeats",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
  "It always seems impossible until it's done. - Nelson Mandela",
  "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
  "In the middle of every difficulty lies opportunity. - Albert Einstein",
  "It does not matter how slowly you go, as long as you do not stop. - Confucius",
  "Don't count the days, make the days count. - Muhammad Ali",
  "The only person you are destined to become is the person you decide to be. - Ralph Waldo Emerson",
  "The best way to predict the future is to create it. - Peter Drucker",
  "Strive not to be a success, but rather to be of value. - Albert Einstein",
  "It's not the years in your life that count, it's the life in your years. - Abraham Lincoln",
  "The purpose of our lives is to be happy. - Dalai Lama",
  "Success is stumbling from failure to failure with no loss of enthusiasm. - Winston S. Churchill",
  "If you want to achieve greatness stop asking for permission. - Anonymous",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "If you are not willing to risk the usual, you will have to settle for the ordinary. - Jim Rohn",
  "The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack in will. - Vince Lombardi",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "If you really look closely, most overnight successes took a long time. - Steve Jobs",
  "You have within you right now, everything you need to deal with whatever the world can throw at you. - Brian Tracy",
  "You only live once, but if you do it right, once is enough. - Mae West",
  "The best way to predict the future is to invent it. - Alan Kay",
  "The secret to getting ahead is getting started. - Mark Twain",
  "Do not wait to strike till the iron is hot, but make it hot by striking. - William Butler Yeats",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
  "It always seems impossible until it's done. - Nelson Mandela",
  "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
  "In the middle of every difficulty lies opportunity. - Albert Einstein",
  "It does not matter how slowly you go, as long as you do not stop. - Confucius",
  "Don't count the days, make the days count. - Muhammad Ali",
  "The only person you are destined to become is the person you decide to be. - Ralph Waldo Emerson",
  "The best way to predict the future is to create it. - Peter Drucker",
  "Strive not to be a success, but rather to be of value. - Albert Einstein",
  "The purpose of our lives is to be happy. - Dalai Lama",
  "Success is stumbling from failure to failure with no loss of enthusiasm. - Winston S. Churchill",
  "If you want to achieve greatness stop asking for permission. - Anonymous",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "If you are not willing to risk the usual, you will have to settle for the ordinary. - Jim Rohn",
  "The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack in will. - Vince Lombardi",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "If you really look closely, most overnight successes took a long time. - Steve Jobs",
  "You have within you right now, everything you need to deal with whatever the world can throw at you. - Brian Tracy",
  "You only live once, but if you do it right, once is enough. - Mae West",
  "The best way to predict the future is to invent it. - Alan Kay",
  "The secret to getting ahead is getting started. - Mark Twain",
  "Do not wait to strike till the iron is hot, but make it hot by striking. - William Butler Yeats",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
  "It always seems impossible until it's done. - Nelson Mandela",
  "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
  "In the middle of every difficulty lies opportunity. - Albert Einstein",
  "It does not matter how slowly you go, as long as you do not stop. - Confucius",
  "Don't count the days, make the days count. - Muhammad Ali",
  "The only person you are destined to become is the person you decide to be. - Ralph Waldo Emerson",
  "The best way to predict the future is to create it. - Peter Drucker",
  "Strive not to be a success, but rather to be of value. - Albert Einstein",
  "It's not the years in your life that count, it's the life in your years. - Abraham Lincoln",
  "The purpose of our lives is to be happy. - Dalai Lama",
  "Success is stumbling from failure to failure with no loss of enthusiasm. - Winston S. Churchill",
  "If you want to achieve greatness stop asking for permission. - Anonymous",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "If you are not willing to risk the usual, you will have to settle for the ordinary. - Jim Rohn",
  "The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack in will. - Vince Lombardi",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "If you really look closely, most overnight successes took a long time. - Steve Jobs",
  "You have within you right now, everything you need to deal with whatever the world can throw at you. - Brian Tracy",
  "You only live once, but if you do it right, once is enough. - Mae West",
  "The best way to predict the future is to invent it. - Alan Kay",
  "The secret to getting ahead is getting started. - Mark Twain",
  "Do not wait to strike till the iron is hot, but make it hot by striking. - William Butler Yeats",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
  "It always seems impossible until it's done. - Nelson Mandela",
  "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
  "In the middle of every difficulty lies opportunity. - Albert Einstein",
  "It does not matter how slowly you go, as long as you do not stop. - Confucius",
  "Don't count the days, make the days count. - Muhammad Ali",
  "The only person you are destined to become is the person you decide to be. - Ralph Waldo Emerson",
  "The best way to predict the future is to create it. - Peter Drucker",
  "Strive not to be a success, but rather to be of value. - Albert Einstein",
  "It's not the years in your life that count, it's the life in your years. - Abraham Lincoln",
  "The purpose of our lives is to be happy. - Dalai Lama",
  "Success is stumbling from failure to failure with no loss of enthusiasm. - Winston S. Churchill",
  "If you want to achieve greatness stop asking for permission. - Anonymous",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "If you are not willing to risk the usual, you will have to settle for the ordinary. - Jim Rohn",
  "The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack in will. - Vince Lombardi",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "If you really look closely, most overnight successes took a long time. - Steve Jobs",
  "You have within you right now, everything you need to deal with whatever the world can throw at you. - Brian Tracy",
  "You only live once, but if you do it right, once is enough. - Mae West",
  "The best way to predict the future is to invent it. - Alan Kay",
  "The secret to getting ahead is getting started. - Mark Twain",
  "Do not wait to strike till the iron is hot, but make it hot by striking. - William Butler Yeats",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
  "It always seems impossible until it's done. - Nelson Mandela",
  "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
  "Believe you can and you're halfway there. - Theodore Roosevelt",
  "Success is not in what you have, but who you are. - Bo Bennett",
  "Be the change that you wish to see in the world. - Mahatma Gandhi",
  "The only impossible journey is the one you never begin. - Tony Robbins",
  "Your attitude, not your aptitude, will determine your altitude. - Zig Ziglar",
  "Life is 10% what happens to us and 90% how we react to it. - Charles R. Swindoll",
  "You are never too old to set another goal or to dream a new dream. - C.S. Lewis",
  "The only way to do great work is to love what you do. - Steve Jobs",
  "Don't let yesterday take up too much of today. - Will Rogers",
  "The best revenge is massive success. - Frank Sinatra",
  "The only thing standing between you and your goal is the story you keep telling yourself. - Jordan Belfort",
  "Don't count the days, make the days count. - Muhammad Ali",
  "Challenges are what make life interesting and overcoming them is what makes life meaningful. - Joshua J. Marine",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "The way to get started is to quit talking and begin doing. - Walt Disney",
  "Success is not just about making money. It's about making a difference. - Unknown",
  "The best revenge is to be unlike him who performed the injustice. - Marcus Aurelius",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "What lies behind us and what lies before us are tiny matters compared to what lies within us. - Ralph Waldo Emerson",
  "Our greatest glory is not in never falling, but in rising every time we fall. - Confucius",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
  "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle. - Christian D. Larson",
  "The only person you are destined to become is the person you decide to be. - Ralph Waldo Emerson",
  "The best way to predict the future is to create it. - Peter Drucker",
  "Strive not to be a success, but rather to be of value. - Albert Einstein",
  "It's not the years in your life that count, it's the life in your years. - Abraham Lincoln",
  "The purpose of our lives is to be happy. - Dalai Lama",
  "Success is stumbling from failure to failure with no loss of enthusiasm. - Winston S. Churchill",
  "If you want to achieve greatness stop asking for permission. - Anonymous",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "If you are not willing to risk the usual, you will have to settle for the ordinary. - Jim Rohn",
  "The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack in will. - Vince Lombardi",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "If you really look closely, most overnight successes took a long time. - Steve Jobs",
  "You have within you right now, everything you need to deal with whatever the world can throw at you. - Brian Tracy",
  "You only live once, but if you do it right, once is enough. - Mae West",
  "The best way to predict the future is to invent it. - Alan Kay",
  "The secret to getting ahead is getting started. - Mark Twain",
  "Do not wait to strike till the iron is hot, but make it hot by striking. - William Butler Yeats",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
  "It always seems impossible until it's done. - Nelson Mandela",
  "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
  "In the middle of every difficulty lies opportunity. - Albert Einstein",
  "It does not matter how slowly you go, as long as you do not stop. - Confucius",
  "Don't count the days, make the days count. - Muhammad Ali",
  "The only person you are destined to become is the person you decide to be. - Ralph Waldo Emerson",
  "The best way to predict the future is to create it. - Peter Drucker",
  "Strive not to be a success, but rather to be of value. - Albert Einstein",
  "It's not the years in your life that count, it's the life in your years. - Abraham Lincoln",
  "The purpose of our lives is to be happy. - Dalai Lama",
  "Success is stumbling from failure to failure with no loss of enthusiasm. - Winston S. Churchill",
  "If you want to achieve greatness stop asking for permission. - Anonymous",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "If you are not willing to risk the usual, you will have to settle for the ordinary. - Jim Rohn",
  "The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack in will. - Vince Lombardi",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "If you really look closely, most overnight successes took a long time. - Steve Jobs",
  "You have within you right now, everything you need to deal with whatever the world can throw at you. - Brian Tracy",
  "You only live once, but if you do it right, once is enough. - Mae West",
  "The best way to predict the future is to invent it. - Alan Kay",
  "The secret to getting ahead is getting started. - Mark Twain",
  "Do not wait to strike till the iron is hot, but make it hot by striking. - William Butler Yeats",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
  "It always seems impossible until it's done. - Nelson Mandela",
  "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
  "Believe you can and you're halfway there. - Theodore Roosevelt",
  "Success is not in what you have, but who you are. - Bo Bennett",
  "Be the change that you wish to see in the world. - Mahatma Gandhi",
  "The only impossible journey is the one you never begin. - Tony Robbins",
  "Your attitude, not your aptitude, will determine your altitude. - Zig Ziglar",
  "Life is 10% what happens to us and 90% how we react to it. - Charles R. Swindoll",
  "You are never too old to set another goal or to dream a new dream. - C.S. Lewis",
  "The only way to do great work is to love what you do. - Steve Jobs",
  "Don't let yesterday take up too much of today. - Will Rogers",
  "The best revenge is massive success. - Frank Sinatra",
  "The only thing standing between you and your goal is the story you keep telling yourself. - Jordan Belfort",
  "Don't count the days, make the days count. - Muhammad Ali",
  "Challenges are what make life interesting and overcoming them is what makes life meaningful. - Joshua J. Marine",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "The way to get started is to quit talking and begin doing. - Walt Disney",
  "Success is not just about making money. It's about making a difference. - Unknown",
  "The best revenge is to be unlike him who performed the injustice. - Marcus Aurelius",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "What lies behind us and what lies before us are tiny matters compared to what lies within us. - Ralph Waldo Emerson",
  "Our greatest glory is not in never falling, but in rising every time we fall. - Confucius",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
  "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle. - Christian D. Larson",
  "The only person you are destined to become is the person you decide to be. - Ralph Waldo Emerson",
  "The best way to predict the future is to create it. - Peter Drucker",
  "Strive not to be a success, but rather to be of value. - Albert Einstein",
  "It's not the years in your life that count, it's the life in your years. - Abraham Lincoln",
  "The purpose of our lives is to be happy. - Dalai Lama",
  "Success is stumbling from failure to failure with no loss of enthusiasm. - Winston S. Churchill",
  "If you want to achieve greatness stop asking for permission. - Anonymous",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "If you are not willing to risk the usual, you will have to settle for the ordinary. - Jim Rohn",
  "The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack in will. - Vince Lombardi",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "If you really look closely, most overnight successes took a long time. - Steve Jobs",
  "You have within you right now, everything you need to deal with whatever the world can throw at you. - Brian Tracy",
  "You only live once, but if you do it right, once is enough. - Mae West",
  "The best way to predict the future is to invent it. - Alan Kay",
  "The secret to getting ahead is getting started. - Mark Twain",
  "Do not wait to strike till the iron is hot, but make it hot by striking. - William Butler Yeats",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
  "It always seems impossible until it's done. - Nelson Mandela",
  "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
  "Believe you can and you're halfway there. - Theodore Roosevelt",
  "Success is not in what you have, but who you are. - Bo Bennett",
  "Be the change that you wish to see in the world. - Mahatma Gandhi",
  "The only impossible journey is the one you never begin. - Tony Robbins",
  "Your attitude, not your aptitude, will determine your altitude. - Zig Ziglar",
  "Life is 10% what happens to us and 90% how we react to it. - Charles R. Swindoll",
  "You are never too old to set another goal or to dream a new dream. - C.S. Lewis",
  "The only way to do great work is to love what you do. - Steve Jobs",
  "Don't let yesterday take up too much of today. - Will Rogers",
  "The best revenge is massive success. - Frank Sinatra",
  "The only thing standing between you and your goal is the story you keep telling yourself. - Jordan Belfort",
  "Don't count the days, make the days count. - Muhammad Ali",
  "Challenges are what make life interesting and overcoming them is what makes life meaningful. - Joshua J. Marine",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "The way to get started is to quit talking and begin doing. - Walt Disney",
  "Success is not just about making money. It's about making a difference. - Unknown",
  "The best revenge is to be unlike him who performed the injustice. - Marcus Aurelius",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "What lies behind us and what lies before us are tiny matters compared to what lies within us. - Ralph Waldo Emerson",
  "Our greatest glory is not in never falling, but in rising every time we fall. - Confucius",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle. - Christian D. Larson",
  "The only person you are destined to become is the person you decide to be. - Ralph Waldo Emerson",
  "The best way to predict the future is to create it. - Peter Drucker",
  "Strive not to be a success, but rather to be of value. - Albert Einstein",
  "It's not the years in your life that count, it's the life in your years. - Abraham Lincoln",
  "The purpose of our lives is to be happy. - Dalai Lama",
  "Success is stumbling from failure to failure with no loss of enthusiasm. - Winston S. Churchill",
  "If you want to achieve greatness stop asking for permission. - Anonymous",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "If you are not willing to risk the usual, you will have to settle for the ordinary. - Jim Rohn",
  "The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack in will. - Vince Lombardi",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "If you really look closely, most overnight successes took a long time. - Steve Jobs",
  "You have within you right now, everything you need to deal with whatever the world can throw at you. - Brian Tracy",
  "You only live once, but if you do it right, once is enough. - Mae West",
  "The best way to predict the future is to invent it. - Alan Kay",
  "The secret to getting ahead is getting started. - Mark Twain",
  "Do not wait to strike till the iron is hot, but make it hot by striking. - William Butler Yeats",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
  "It always seems impossible until it's done. - Nelson Mandela",
  "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
  "Believe you can and you're halfway there. - Theodore Roosevelt",
  "Success is not in what you have, but who you are. - Bo Bennett",
  "Be the change that you wish to see in the world. - Mahatma Gandhi",
  "The only impossible journey is the one you never begin. - Tony Robbins",
  "Your attitude, not your aptitude, will determine your altitude. - Zig Ziglar",
  "Life is 10% what happens to us and 90% how we react to it. - Charles R. Swindoll",
  "You are never too old to set another goal or to dream a new dream. - C.S. Lewis",
  "The only way to do great work is to love what you do. - Steve Jobs",
  "Don't let yesterday take up too much of today. - Will Rogers",
  "The best revenge is massive success. - Frank Sinatra",
  "The only thing standing between you and your goal is the story you keep telling yourself. - Jordan Belfort",
  "Don't count the days, make the days count. - Muhammad Ali",
  "Challenges are what make life interesting and overcoming them is what makes life meaningful. - Joshua J. Marine",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "The way to get started is to quit talking and begin doing. - Walt Disney",
  "Success is not just about making money. It's about making a difference. - Unknown",
  "The best revenge is to be unlike him who performed the injustice. - Marcus Aurelius",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "What lies behind us and what lies before us are tiny matters compared to what lies within us. - Ralph Waldo Emerson",
  "Our greatest glory is not in never falling, but in rising every time we fall. - Confucius",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
  "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle. - Christian D. Larson",
  "The only person you are destined to become is the person you decide to be. - Ralph Waldo Emerson",
  "The best way to predict the future is to create it. - Peter Drucker",
  "Strive not to be a success, but rather to be of value. - Albert Einstein",
  "It's not the years in your life that count, it's the life in your years. - Abraham Lincoln",
  "The purpose of our lives is to be happy. - Dalai Lama",
  "Success is stumbling from failure to failure with no loss of enthusiasm. - Winston S. Churchill",
  "If you want to achieve greatness stop asking for permission. - Anonymous",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "If you are not willing to risk the usual, you will have to settle for the ordinary. - Jim Rohn",
  "The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack in will. - Vince Lombardi",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "If you really look closely, most overnight successes took a long time. - Steve Jobs",
  "You have within you right now, everything you need to deal with whatever the world can throw at you. - Brian Tracy",
  "You only live once, but if you do it right, once is enough. - Mae West",
  "The best way to predict the future is to invent it. - Alan Kay",
  "The secret to getting ahead is getting started. - Mark Twain",
  "Do not wait to strike till the iron is hot, but make it hot by striking. - William Butler Yeats",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
  "It always seems impossible until it's done. - Nelson Mandela",
  "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
  "Believe you can and you're halfway there. - Theodore Roosevelt",
  "Success is not in what you have, but who you are. - Bo Bennett",
  "Be the change that you wish to see in the world. - Mahatma Gandhi",
  "The only impossible journey is the one you never begin. - Tony Robbins",
  "Your attitude, not your aptitude, will determine your altitude. - Zig Ziglar",
  "Life is 10% what happens to us and 90% how we react to it. - Charles R. Swindoll",
  "You are never too old to set another goal or to dream a new dream. - C.S. Lewis",
  "The only way to do great work is to love what you do. - Steve Jobs",
  "Don't let yesterday take up too much of today. - Will Rogers",
  "The best revenge is massive success. - Frank Sinatra",
  "The only thing standing between you and your goal is the story you keep telling yourself. - Jordan Belfort",
  "Don't count the days, make the days count. - Muhammad Ali",
  "Challenges are what make life interesting and overcoming them is what makes life meaningful. - Joshua J. Marine",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "The way to get started is to quit talking and begin doing. - Walt Disney",
  "Success is not just about making money. It's about making a difference. - Unknown",
  "The best revenge is to be unlike him who performed the injustice. - Marcus Aurelius",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "What lies behind us and what lies before us are tiny matters compared to what lies within us. - Ralph Waldo Emerson",
  "Our greatest glory is not in never falling, but in rising every time we fall. - Confucius",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
  "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle. - Christian D. Larson",
  "The only person you are destined to become is the person you decide to be. - Ralph Waldo Emerson",
  "The best way to predict the future is to create it. - Peter Drucker",
  "Strive not to be a success, but rather to be of value. - Albert Einstein",
  "It's not the years in your life that count, it's the life in your years. - Abraham Lincoln",
  "The purpose of our lives is to be happy. - Dalai Lama",
  "Success is stumbling from failure to failure with no loss of enthusiasm. - Winston S. Churchill",
  "If you want to achieve greatness stop asking for permission. - Anonymous",
  "The only place where success comes before work is in the dictionary. - Vidal Sassoon",
  "Don't be afraid to give up the good to go for the great. - John D. Rockefeller",
  "If you are not willing to risk the usual, you will have to settle for the ordinary. - Jim Rohn",
  "The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack in will. - Vince Lombardi",
  "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
  "If you really look closely, most overnight successes took a long time. - Steve Jobs",
  "You have within you right now, everything you need to deal with whatever the world can throw at you. - Brian Tracy",
  "You only live once, but if you do it right, once is enough. - Mae West",
  "The best way to predict the future is to invent it. - Alan Kay",
  "The secret to getting ahead is getting started. - Mark Twain",
  "Do not wait to strike till the iron is hot, but make it hot by striking. - William Butler Yeats",
  "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
  "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
  "It always seems impossible until it's done. - Nelson Mandela",
  "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
  "Believe you can and you're halfway there. - Theodore Roosevelt",
  "Success is not in what you have, but who you are. - Bo Bennett",
  "Be the change that you wish to see in the world. - Mahatma Gandhi",
  "The only impossible journey is the one you never begin. - Tony Robbins",
  "Your attitude, not your aptitude, will determine your altitude. - Zig Ziglar",
  "Life is 10% what happens to us and 90% how we react to it. - Charles R. Swindoll",
  "You are never too old to set another goal or to dream a new dream. - C.S. Lewis",
  "The only way to do great work is to love what you do. - Steve Jobs",
  "Don't let yesterday take up too much of today. - Will Rogers",
  "The best revenge is massive success. - Frank Sinatra",
  "The only thing standing between you and your goal is the story you keep telling yourself. - Jordan Belfort",
  "Don't count the days, make the days count. - Muhammad Ali",
  "Challenges are what make life interesting and overcoming them is what makes life meaningful. - Joshua J. Marine",
];

class AnimatedQuoteList extends StatefulWidget {
  const AnimatedQuoteList({super.key});

  @override
  _AnimatedQuoteListState createState() => _AnimatedQuoteListState();
}

class _AnimatedQuoteListState extends State<AnimatedQuoteList> {
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 15), (Timer timer) {
      _animateToNextQuote();
    });

    _animateToNextQuote();
  }

  void _animateToNextQuote() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % quotes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: QuoteWidget(
        key: ValueKey<int>(_currentIndex),
        quote: quotes[_currentIndex],
      ),
      transitionBuilder: (Widget child, Animation<double> animation) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        var offsetAnimation = Tween(begin: begin, end: end).animate(animation);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class QuoteWidget extends StatelessWidget {
  final String quote;

  const QuoteWidget({required Key key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var quoteParts = quote.split(' - ');
    var quoteText = quoteParts[0];
    var owner = quoteParts.length > 1 ? quoteParts[1] : '';

    return ListTile(
      title: text(
        giveText: "\"$quoteText\"",
        fontsize: 17,
        maxLine: 10,
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(),
          Text(
            """

-$owner""",
            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}