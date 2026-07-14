Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643B648C8CE
	for <linux-coco@lists.linux.dev>; Tue, 14 Jul 2026 16:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784045682; cv=none; b=ucpEBj01g6FWSJDH/2+Dc9N9lRN0UPYEhBfIxECaM6h2Hx7cDc/CFmCUhkxxnffnA9TN+GqoOmcddjZYG3ff0NS7XbMOsZwzAGzl1mLHtY2gBh18KYOBxp0LnlBeSP8/xBbk2DdC7SnywBtqdVnKLaGVSkVEVmT8ULhmCwO77jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784045682; c=relaxed/simple;
	bh=kQ6MFm1RcBK5lthrtsS3tKwgEUgIjQSVP8M3aj6hNVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Ikr5WyQg898R70gXqQOaRaie8NWnBkoD9nn4sBPWJFiVHKOKHYNAwWgjYkzl8Xh01zOAaTy/W7kOICr679BsY9AEN/p5AcXu27ElJE938ZZ5f35khy+3lhQH9Zt1huytMOVWrFL3ZO4V3ZBRvRa594F1lSZhbgwIIToD312YCgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f0+jgcWq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f0+jgcWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784045680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=coBt7Zb3aZ3ZG0mTYJhcJ0JzfkK/zs88iplrFlJsbyY=;
	b=f0+jgcWq990sHjWAQlt1/WI2rzuf1X3ET/OWYqzgh89ctrKktWOjbPfFpScNCOlRC+XrFL
	eKz9iZm18pKWF+iGL5xbOQo+i3EsV2do0wgNpRaDj1UY6nAXcedgBDzG+5iDMOAT7xoGR7
	mtFEAMVtcjBFGEMQx2LRt4DVdTj8wvQ=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-2oJSSZpgPhu0Zjx8JN2exQ-1; Tue, 14 Jul 2026 12:14:37 -0400
X-MC-Unique: 2oJSSZpgPhu0Zjx8JN2exQ-1
X-Mimecast-MFC-AGG-ID: 2oJSSZpgPhu0Zjx8JN2exQ_1784045677
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-666399de8fcso8950334d50.2
        for <linux-coco@lists.linux.dev>; Tue, 14 Jul 2026 09:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784045677; x=1784650477;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coBt7Zb3aZ3ZG0mTYJhcJ0JzfkK/zs88iplrFlJsbyY=;
        b=YHdEV+dLTNtUBk8PBlwbY5+YFgDu+xygccrYQ2ptx3FMwQ+GyHX4PZjjPbuoCdfYGK
         r5JWgW+cdlMuoQrPh+ZTM9ObHmKaWpapzlfxQ3ZLTL+vo1dJ1x3Ivg6QIfSWMo9Ga0l/
         HPAt+rNPkR42LenDJImuBgrc5wdmVtPWtXGybz9XAqThFb9BTMoiNNWPdkWyDKelCCed
         sUYmq9wDU+sHZ6ezaKCFt6CQMFxh2MZw5Do4vHezBdwfQa/igfRcmpBZr67QAvpikMJJ
         /pI4UCO765tpJC+0Aeai96mm7fqwbxwwTk1myUsgSTEEEYIJopSZ9//pUTxzrjvA/1nj
         X8qQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBcmc1yUp9AJeFZl3+wb/suk9TgnVjAWVpIsm1KQnAUum9+3gkbnKVPdis3r/CgHMqgPScVyouq8DR@lists.linux.dev
X-Gm-Message-State: AOJu0YzrTattLviIIACc2d2irrIbb6ApxGSBs8BQTcq+sLpmZQAq/TuX
	x6GoZeQn592rfSk3GJJ7iB03bbMWkcfUMzGfRYgzVWrw3EkZRcL7ir374mZvk+J87muc/WAnsiY
	CaRJ1c2Q3hEs5WtueB99VPz9tTeuCUc+BH98MX14BHREDknvqz7DIt8Z3LQLUV4wuFIUjrnXmBr
	QhZyNQJzJvSGx+zU/RMRYt9vj0E8MfNkcyP3qnAqFp5rRH4w==
X-Gm-Gg: AfdE7ckLO8HmP37x1TrrKZcvcbikgbDmMyvwvTfnnEFZcZWg9OLxan+q2D4b//y5YAE
	7ASOqGkPoWidUAxlwu7GO9sxdozCGoi6S5ar6QTdvT8NxQHg91RSJWcW0mlkY/XJpXGYc6S+AHo
	Q2jXkaVxeA1eyyaC9qq6ZmpUPKwdM0Wo6K+MQuNyeyIFyKk8FqgvyFf/lzeN1Maow6
X-Received: by 2002:a05:690e:b8b:b0:668:931:6284 with SMTP id 956f58d0204a3-668093178f5mr1491192d50.22.1784045676885;
        Tue, 14 Jul 2026 09:14:36 -0700 (PDT)
X-Received: by 2002:a05:690e:b8b:b0:668:931:6284 with SMTP id
 956f58d0204a3-668093178f5mr1491158d50.22.1784045676337; Tue, 14 Jul 2026
 09:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGxU2F5hP=7pA1rKRvq5sgr0t2y1YoUzYCmH8hzaCS58U4+Y3A@mail.gmail.com>
In-Reply-To: <CAGxU2F5hP=7pA1rKRvq5sgr0t2y1YoUzYCmH8hzaCS58U4+Y3A@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 14 Jul 2026 18:14:24 +0200
X-Gm-Features: AUfX_mwjFvcoxi29cRMJOsZPgt37LHTV3cOwag5sNZw6X_Tr_Ucj0sF3N41PysY
Message-ID: <CAGxU2F6ko6Ojyu138cB7szTszoYkx1AEw5oK6EMMaUoi=m7+sw@mail.gmail.com>
Subject: SVSM Development Call July 15th, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wcP6bd00pE3W1-t4__CI8MnSpx7rIok8kVEzdtXz-AI_1784045677
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the call for agenda items for this weeks SVSM development
call. Please send any agenda items you have in mind as a reply to this
email or raise them in the meeting.

We will use the LF Zoom instance. Details of the meeting can be found
in our governance repository at:

        https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

        https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,
Stefano

