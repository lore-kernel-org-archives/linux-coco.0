Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955982;
	b=Ssm5ugcVJAbjVw2KSWxp7VWqOvrs2zlD+J044Q/gpf71nTxL8Kc6o4gL92vvgi1FTiJT
	 pC0W4A85SLK5IrKVca51PNnoClWIZy7o0ouVkHoTmoVakUjyvjV7YAZPen4e1DwiOpYzk
	 ArZ+4WgHcVwDLxC4Pj96eSlEVVwtv8GyMRIDu+EpSrje7iPmk4LdQkqau4N5aHUcVXqek
	 YkDDx1TRV04KaZl2H7CCYFt6iAN6qT4iQpdbViTRTT+u+lNskHfF13mW8QqcBpuaVYKTm
	 dybvZkY6nn/uSONqNsyEzLgliNjNRy7ERYXRwZmCO431v0RhAcwkR4NQrvHRkaEPLeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955982;
	h=DMARC-Filter:DKIM-Signature:X-MC-Rep:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type;
	bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
	b=ev9qPHKkvfp3lWP/JPuFVA6IHbO+ZzmH7oZAKRGLH6+79wi77vALG7m/BLlPMtV4bBlo
	 5n1wZAkkUuT8wy6vHYbMRNSVmqqkjyoIasvkU6JkhRXUd+h/rM6Ws3WznbPToGnDsnvsw
	 BQYLYUwAEE5u8kwj2xrD+tBPA7oys4t5TlTogavJTZOD1lrwoKUS82lw6KvlO+s9mqsMP
	 vCIA6nioC/EaiNxuLBZbbI5psIQsF2HO8sec443HnVR/qKk4hJ8/tRzCSEcC6QZ9xASm/
	 rpWCxMuUnH3QEPdOKQTN8bb8R4HuvS0qH0baQAP8bhLyv7A4EtadteXT3ZGmV3mn+gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gM2t1aNa;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C049606A31C
	for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 22:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C049606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gM2t1aNa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794955980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
	b=gM2t1aNaBrFhQNQuqFlyLnfDx6vlIUyPR55lVRMd+ki/E4KMOwh27+4suYkqEXzhF1f3ep
	dY3vrpSvKXnBUMhyIArAGqN67gz3St1KpmKt449cDcaK2T4A4EduKC1DC55wHpf8KONGTX
	qL4KGBAoPvSSa7lhUdNlQFicTu3N5mI=
X-MC-Rep: binary re single
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-xHiitc6xPSCwhYwXsIrGJQ-1; Tue, 17 Nov 2026 17:52:58 -0500
X-MC-Unique: xHiitc6xPSCwhYwXsIrGJQ-1
X-Mimecast-MFC-AGG-ID: xHiitc6xPSCwhYwXsIrGJQ_1794955978
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efad644688so2451205ad.3
        for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 14:52:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955978; x=1795560778;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
        b=NtxbbofeCp6vMqpIls95nb5q4H0DEoRxRtqjHXeE2UrSuEO2pFt2Th8mosiQfuvEKy
         52nNs3uM5VjWAdkTr4K6lusyLHEgKvyDG7vRQ8EoAOBn1EBjtcSwTKO0JCNEPW3bLcNH
         eIJYE6ELCzSBxV8UkX4tiTlKer8Qc6/Yf1Zd5VHcdLx4cUIS3O/cLIK0alhcQfl8/AZ+
         OK3bGXBKNopUbLp9/w81Sork3PWVM6lQmZy72gRjahNuazPS59XXRBNKEBBNspLaa4g1
         y6hW9pp4rCMWqIUtPzwGXVX4DZe+TZeDGpmA02AxJ8kLSUexc60GOdCDLFZ7jM7Oxyk8
         V/wA==
X-Forwarded-Encrypted: i=1; AL+hErGJkjVdFSxdmxq69bkon5AHk7H8KroD29mqBLjxKQoK0jAfR5mk24maAtOlzjcOzvnBp17UhNoHz8e8@lists.linux.dev
X-Gm-Message-State: APuU4Z/JliQd9St/uvYbWAgxTSS7gAdGA0kacDWBcYktvHzT6yWVWbNr
	26BKuVJ4ol3CbUDdDGanNiquVqu9jw7R+Q3KaJrJcQixEeQuYT+Ox1yt6XSnn8hk6RRKybKaHZ4
	60fAZayL+ET5PXVbGsSql60MVRGWFqxyS0gfJI2QsAuS8LSQmpBySw9XhAZB4QkYzMNFjCHx3oM
	Vil6AAdpu7WSwZKc50icGBxxLymD1JlTUugY8sDg==
X-Gm-Gg: AZFdTZeG7vVo4tvqvS3y9Y26FUDoNzSFx0Zuf332eUjMeNUSyhuJB2KRkZLgm738mXm
	+iFlVK9ikznblfQRg/4ExEi4HvlsjAjGGH4giZJAFiGVuahDBU7Px4i0ICiW1GXtsyEwZn5QLOr
	tSGaodLhZdS65m2T2oJefLyhAOtxfy8wY7B0Ftgdl2zZ4UT+O4LmCe64efOw==
X-Received: by 2002:a17:902:e790:b0:2e2:dfb8:818a with SMTP id d9443c01a7336-2eff7574cbamr6491195ad.62.1794955977566;
        Tue, 17 Nov 2026 14:52:57 -0800 (PST)
X-Received: by 2002:a17:902:e790:b0:2e2:dfb8:818a with SMTP id
 d9443c01a7336-2eff7574cbamr6491025ad.62.1794955977016; Tue, 17 Nov 2026
 14:52:57 -0800 (PST)
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
 <CAGxU2F5=Yh_ywLJ0eNAeL_Cqa6LNeThN3r8upRKaXs6ZBed+ug@mail.gmail.com>
In-Reply-To: <CAGxU2F5=Yh_ywLJ0eNAeL_Cqa6LNeThN3r8upRKaXs6ZBed+ug@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 17 Nov 2026 23:52:45 +0100
X-Gm-Features: Aa3M54pcHnE_FTFiw-y6-U_ScXMFc2hV4sru3RD4iJg1cE8QPWLiZ53h5ZVvcnQ
Message-ID: <CAGxU2F5pif_d6ZNca=CovuD4L359+t21mMNqYEcOjd_bAcmqag@mail.gmail.com>
Subject: SVSM Development Call November 18st, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IR-2JsxcAv6Z4x70cYKhgbCo-EeeJVkFpyhrcM9GYds_1794955978
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

