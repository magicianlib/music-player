#include "HttpClient.h"

#include <QNetworkReply>
#include <QNetworkRequest>
#include <QUrl>

HttpClient::HttpClient(QObject* parent) : QObject{parent}, manager_{new QNetworkAccessManager} {
    connect(manager_, &QNetworkAccessManager::finished, this, &HttpClient::finish);
}

void HttpClient::popularRadioStation() {
    QNetworkRequest request{QUrl{"http://localhost:3000/dj/hot"}};
    manager_->get(request);
}

void HttpClient::finish(QNetworkReply* reply) {
    QByteArray data = reply->readAll();
    emit notify(data);
}
