#ifndef HTTPCLIENT_H
#define HTTPCLIENT_H

#include <QNetworkAccessManager>
#include <QObject>

class HttpClient : public QObject {
    Q_OBJECT

  public:
    explicit HttpClient(QObject* parent = nullptr);

    Q_INVOKABLE void popularRadioStation();

  public slots:
    void finish(QNetworkReply* reply);

  signals:
    void notify(QByteArray data);

  private:
    QNetworkAccessManager* manager_{};
};

#endif  // HTTPCLIENT_H
