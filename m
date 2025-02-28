Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B7A280A3E
	for <linux-coco@lists.linux.dev>; Fri, 28 Feb 2025 17:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740762474; cv=none; b=gNk6w8QH06YW5o0q0Cit5hWhdPa9DlKqVkgXeChv/+lfUML5oK9+Zo7jrYKPZ/0YcKLgte9ocVQ47Ka2qiyxSL4gljCs8XW6RB4IvPdkS6N5a+LBeIBD+P8aeKRUkXiwR75aOffoOY/FjBFT+uVhLeULil6/zPlGYnyEJ1ID688=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740762474; c=relaxed/simple;
	bh=UdkFdwGky8r8xX5xE/qH3AptQWC28byd36YcVlJKMHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=LeTIoxJwPWPMEi/mOQ4Ry8+tHQbSyn56wRnaqN1Qwl833BuoPxLcsgPelzHrPIFMPkHOYc8hnAybq2x5VOuejSloR7lCNut2MbTAB3vXwQlwGXz9VyalIM4wktj5QQz0vQpbMpIbVssuYUzSSyCYQDoaXLv7DjKNF4XBVe2pDis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gIAvqXkm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gIAvqXkm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740762471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h8oGEg/h+TCiOvWbhbC4Zsf5+aY/ltLTYIAtq8932Y4=;
	b=gIAvqXkmX1TF0vwUI/PF21zMiw2TRZtN5gTJgcmMGv7HS6s2FELvEbnxkDyz01Bc5b4kWZ
	/FGgAZdR2gul4u8y+VNMFhgMF16nD7/Jtb2gAejpAZUcVWv7GKOKhddHOKFrr4xqinVIHO
	ccBVmXpJClAMkOpzejsTw6ON8YSurYs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-P1A5pDZ7PNyni21zxZPreA-1; Fri, 28 Feb 2025 12:07:50 -0500
X-MC-Unique: P1A5pDZ7PNyni21zxZPreA-1
X-Mimecast-MFC-AGG-ID: P1A5pDZ7PNyni21zxZPreA_1740762469
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-390f11e6fdbso418193f8f.0
        for <linux-coco@lists.linux.dev>; Fri, 28 Feb 2025 09:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740762469; x=1741367269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8oGEg/h+TCiOvWbhbC4Zsf5+aY/ltLTYIAtq8932Y4=;
        b=Wh/Bd7I1gEelWcGGlCG3NEOMwxVRKzn+t4B7wHloXffLuNR11kguuRqBLZWRCVWybc
         o6wCHHkmmTakOf2wmPNIwXIr8wsrAtD/DoAL5F7SJlimhWMz0kqVSB3E3Ppym+Ah76sF
         AhfeoeFyaZCRVH+wz+MFJEt/NpKrzihVrAhhOwYagA3tFeVH4KBjK20uW3tqSORQg7YI
         etBpG56d1daWND59R/Yg3Fj2uZz+r8jaPbqhzTaZZ7O8+7rfoXCQ4/3jnTp+43wZsYIm
         DUWtf3yl4yiwbANQjU46qIvCBKsgSQgYuXnCP5vsX9vs1DH7gHtGjJVSOAX3MmN/aTuC
         1+hA==
X-Forwarded-Encrypted: i=1; AJvYcCVFeMIWmxHA3Qr84SZVVOWRV+A9+EOR9wJwBpyBSQQum1SxtKx/VrIviB4MEe0G7JWYTe4PLhWOO7Di@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7oUv/QaYmrP87lb+MJiOdPUfI4D1mVeAQ6l9s8jW87RMFMZub
	1imhj6mCn6rQ2FM6VqPDXIk/F9GcmkoLsVuW4VY4Io7S5lAHZsWozhHoXbnn6ipb5qwBkpCUoHP
	DLY8lBAqCt0rOgMYDle5o1eWFK2Jqf3zHGqJQuIuorZHfWVdl6wu2E1CjNCo=
X-Gm-Gg: ASbGncskgqSpksOYps8nLwOJlyDx+OF29B5NGyCcPlE4RVkKKnruDpV9Fw0KpW6QNZS
	rj5XhFzzZFSlCkq57fh+iuJkNvUuVP3tM3Qa/LdWq6alWsdWOkWac218ngf2vZAT/728MvHbZ5I
	lWVwb00leYznjZyS17Sqc1f90RWVnOy6AsBgZitlEBJgUIE27JfhmzmV7kwCHKvdnavodcRaDs2
	J08bnC+WsDjKVws/INAYgl7zrhim7QIPPVQTzzJBk9u9a4O0UEcSTgWHnJfZoo7G+HbzlLlxO+V
	RwrbXK+HL4CEBf7BLw6p
X-Received: by 2002:a5d:64a6:0:b0:38f:503c:ad80 with SMTP id ffacd0b85a97d-390ec7c7039mr3336372f8f.5.1740762468735;
        Fri, 28 Feb 2025 09:07:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/Nxe6WMAVJwXXr/C1J+GuxrUo1O7QoMaasTUiuVrqT64txBIeDvvVO3zbdNEwK5gDuewOmA==
X-Received: by 2002:a5d:64a6:0:b0:38f:503c:ad80 with SMTP id ffacd0b85a97d-390ec7c7039mr3336286f8f.5.1740762467958;
        Fri, 28 Feb 2025 09:07:47 -0800 (PST)
Received: from stex1.redhat.com ([5.179.147.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5710ebsm98667785e9.26.2025.02.28.09.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 09:07:45 -0800 (PST)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	x86@kernel.org,
	Dov Murik <dovmurik@linux.ibm.com>,
	linux-coco@lists.linux.dev,
	Dionna Glaze <dionnaglaze@google.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Ingo Molnar <mingo@redhat.com>,
	Joerg Roedel <jroedel@suse.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [RFC PATCH v2 3/6] tpm: add send_recv() ops in tpm_class_ops
Date: Fri, 28 Feb 2025 18:07:17 +0100
Message-ID: <20250228170720.144739-4-sgarzare@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228170720.144739-1-sgarzare@redhat.com>
References: <20250228170720.144739-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jlfSb3V3eZx9YsJd469vAtaiuAFovvfSt0GaVU47BKk_1740762469
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Some devices do not support interrupts and provide a single operation
to send the command and receive the response on the same buffer.

To support this scenario, a driver could set TPM_CHIP_FLAG_IRQ in the
chip's flags to get recv() to be called immediately after send() in
tpm_try_transmit().

Instead of abusing TPM_CHIP_FLAG_IRQ, introduce a new callback
send_recv(). If that callback is defined, it is called in
tpm_try_transmit() to send the command and receive the response on
the same buffer in a single call.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/linux/tpm.h              | 2 ++
 drivers/char/tpm/tpm-interface.c | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index 20a40ade8030..2ede8e0592d3 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -88,6 +88,8 @@ struct tpm_class_ops {
 	bool (*req_canceled)(struct tpm_chip *chip, u8 status);
 	int (*recv) (struct tpm_chip *chip, u8 *buf, size_t len);
 	int (*send) (struct tpm_chip *chip, u8 *buf, size_t len);
+	int (*send_recv)(struct tpm_chip *chip, u8 *buf, size_t buf_len,
+			 size_t to_send);
 	void (*cancel) (struct tpm_chip *chip);
 	u8 (*status) (struct tpm_chip *chip);
 	void (*update_timeouts)(struct tpm_chip *chip,
diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index b1daa0d7b341..4f92b0477696 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -82,6 +82,9 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 		return -E2BIG;
 	}
 
+	if (chip->ops->send_recv)
+		goto out_recv;
+
 	rc = chip->ops->send(chip, buf, count);
 	if (rc < 0) {
 		if (rc != -EPIPE)
@@ -123,7 +126,10 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 	return -ETIME;
 
 out_recv:
-	len = chip->ops->recv(chip, buf, bufsiz);
+	if (chip->ops->send_recv)
+		len = chip->ops->send_recv(chip, buf, bufsiz, count);
+	else
+		len = chip->ops->recv(chip, buf, bufsiz);
 	if (len < 0) {
 		rc = len;
 		dev_err(&chip->dev, "tpm_transmit: tpm_recv: error %d\n", rc);
-- 
2.48.1

