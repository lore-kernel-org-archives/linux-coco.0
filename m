Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519684;
	b=bqK5iKuBDhAtgXMNHiOslQyqj7gaccloIxb6WgUMfOlHg9uSoweq4g43+UUw4u0tKAfz
	 sgoodHTHsU4Kf87itrUCg2y6Kj1SKeoQAZdI9TKI1oEshZY8cv9i9ia0pfE+vd5AGh40G
	 TbALDLz9ITCe/VBYAxaf1YcUntKQWqX6WB/zUtcbEbYCM23aGmEcEjaghoz13U/9nDTrC
	 h9jluzmJB6NmKYOmyMVg9UP+UpEiGUJt/EZ7M1a5NqmY3IjrEufVFB/fiHktZJV9tFFDA
	 DAg9X3ayAn6JyzVvEQ32FQv7L25rodIk1ekOjT4EnUimJyVKICs4UvOQDOqNJScvI8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519684;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type;
	bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
	b=k5Gt8pvKpKB3NZlFWDGhGy/YWPmAamWptjVffBPFfEdYrqWdPKSpGaz0jPnTKsOuOqZK
	 u2HFmnMI0SCNOM+gqSDNxSxthmJdTfWbTA2MAkdzeLdaoLpdwAQP4NUFVDXsPbJ6hkM3r
	 UyuHw/hCzYtaJgrqobsoHELkJNqlgxiqOFFmQ+WlSr8E9D1C8NZFy80P8uN/ZpkOncZkc
	 9LF05c+QLSmbZEPLh+7nn0qgFFrpuGyxS9jCNyjfRSRM5tzkjTItX2Pv0kC59YVdOrvis
	 wnNkd4lX0GocwjNPpxrMBXLcfomEdWALRbGIE3NuhPUqyYFwh68zgkGiMUMg+AZXt3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XMD+fZeT;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A42606A31A
	for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 18:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XMD+fZeT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792519682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
	b=XMD+fZeTKWKMU8Yy9gkyxPPNK1KHdtJ2Rvm7/RpgUGrFnA7iBE2+n881HLaYMOZN/SmGnd
	dmhGtBm3WeyKr0FC9x7W7YThqIXvY+kJixJ/INuHI4lE49OyU+Lf90tGSF1bh0dSt8lg/3
	CevcDLELHH9fWZ4Q4ozGdyXdA8swlOM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-SxyKTEB_OImNI9AKbfBRrQ-1; Tue, 20 Oct 2026 18:08:00 +0000
X-MC-Unique: SxyKTEB_OImNI9AKbfBRrQ-1
X-Mimecast-MFC-AGG-ID: SxyKTEB_OImNI9AKbfBRrQ_1792519679
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93f67358eso34554725ad.1
        for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 11:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519679; x=1793124479;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
        b=Ef94ANIyng7IuFT2l/WcCvee8Q8q978QOZLnJTMrvXqXt8Mh5OLakpUm4A097z6kYH
         vR2LfH8Ur2ER1N6K4u+vPggN8urWpHLtZehf9SDoTRMpsohqwaDuz98Jvk1FFFp3wRZY
         ulWdLMPCpL5He6EZgTFt2r+D8ikRRh3vgBiYYQmJ0CO/9ZSP92c5I3s0+G8pB3uzBlON
         blf/AQDlxrfxJgomeJCxeA+dL7/5npdIvgXEm76YPJ7rj2NrDq9pnXWs+/0iHe2MBYYW
         ITaCm+jTOct3NPmFtodrEbMpdPeNyd9LDPs3EYlv0dRrDK+fB+5Lfej0PkNS0qzUBuq9
         WF+w==
X-Forwarded-Encrypted: i=1; AKwUvBwI2Z4o7qvLctBjYa9i2Ght801r2kFNA34ciOjXmG6n0IXu43/bg7U1WAIOZ5QQH8LXXqblPtn+GRGB@lists.linux.dev
X-Gm-Message-State: AFq9FYJ2Ow760tSanEsUoZhdIrcvhx3BVxoYo0iYlcupht5cLq3ooSwV
	dDRXZoTCbVKN1RWEEzpW206aPyobe+XFn2CYDzV/cUf/y+ggNbtWjt30TxYKB3RkT0BuxuPqL+5
	3wKBgFU+Gc6QqUfFKK1GJd9LBBdaaIvqOB0cz7ipPGCE2J5N6UgMeOSVOWRtI8uQJn2x17OBnKc
	PzBXyzzDK6njCIGNmcpZbleB612UMi6gApOqfW5Q==
X-Gm-Gg: AYBFou2F37sf87t2G4jmai6ixZhtp1hm57X2i631PNsGQTQzeC9p9Nj8IB0rYVD5X+9
	NgOh5N5fciE4zcAvIkc2aRt9O8LvYW48pXua2u91x9q5zsqqRK3TXVMbQwHclVp9RZYMnss2bIP
	6enWPoQBR1pXnQRhBQiN6Ftl/xOY9bi8wXI8aeeoscWVFUBDJGCk+dqalW
X-Received: by 2002:a17:902:ce83:b0:2e9:6352:6c61 with SMTP id d9443c01a7336-2e9a69f7224mr102884735ad.19.1792519679123;
        Tue, 20 Oct 2026 11:07:59 -0700 (PDT)
X-Received: by 2002:a17:902:ce83:b0:2e9:6352:6c61 with SMTP id
 d9443c01a7336-2e9a69f7224mr102884535ad.19.1792519678550; Tue, 20 Oct 2026
 11:07:58 -0700 (PDT)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <aqlXypyTlhuLRVmD@8bytes.org> <CAGxU2F4VaSUGe7QkhqCm2=AzcYxzZqgxm+yjk=QTRkUTxq_3Ew@mail.gmail.com>
In-Reply-To: <CAGxU2F4VaSUGe7QkhqCm2=AzcYxzZqgxm+yjk=QTRkUTxq_3Ew@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 20 Oct 2026 20:07:47 +0200
X-Gm-Features: AclHuK8gyhvcHmD5hX_iUDvlrI0WRLZ-WRmf8s24k9YFuz3ZgH6kSPpmE4GTYFc
Message-ID: <CAGxU2F5=Yh_ywLJ0eNAeL_Cqa6LNeThN3r8upRKaXs6ZBed+ug@mail.gmail.com>
Subject: SVSM Development Call October 21st, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _xFcxjCnkpOiU7SbihtHUhH232wZRaf8wf0LR9YTI_k_1792519679
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the call for agenda items for this weeks SVSM development call.  Please
send any agenda items you have in mind as a reply to this email or raise them
in the meeting.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

        https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

        https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Ciao,
Stefano

