Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD5325E834
	for <linux-coco@lists.linux.dev>; Wed, 25 Jun 2025 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859729; cv=none; b=jL4NaGCjDufQpTQcuYlEhKNU0IlUOkffWHI6yFIVFJnliz8U68WI75npK+/vDAIpyTPGROucZjPpaB4kl4zvvT3cUVVdtFc5qgNPgvlsW+Z/qBd7qPTBQgGlLFnjAarRqLOdemcEH7gvSSbzFdWk5OCqhPjotTuNl9J6eyNVwh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859729; c=relaxed/simple;
	bh=aTTu2+dxl5qZVhbWbOtoDXW2Jb+fV6msOBn/v8kAaCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEVsqQSzkiU6yrgVXXpmvRCmtVSKHnvZ5XK5uefu83UM57o4FuuEh7KPC3wd6yB91d8H0PsI6kiCCTTkHt9EzJ/MHYEt2Dy0aphY4VqDbseNDvgpppZtGjwiRQfFRujlwyUaEFgIJwc6hyz+k2oloIocLobkjjk1bP/rfyDeAMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DyBqlzAx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DyBqlzAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750859726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ok1Q+VndY6BL0FE9sE7eYDBp5x3YoFSF5XsyVPQ30Fw=;
	b=DyBqlzAxWiyaCAMwDkKgZ6O5L2KsZ1fqyDhP/D8mKLYdsv5D+vCjiYdx3G1HjXls5/CPzP
	4KM0ZER+7npvUikpHuH0taa0jukC+Jz3L9hiyYNlL8kIpLhr9yQRgtq0A0qV8ee3t2lMu0
	kIzHs7EgIZedl38SpASrEPLNpo77kYc=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-dghJa56cORWPv10HA0Ur2Q-1; Wed, 25 Jun 2025 09:55:25 -0400
X-MC-Unique: dghJa56cORWPv10HA0Ur2Q-1
X-Mimecast-MFC-AGG-ID: dghJa56cORWPv10HA0Ur2Q_1750859725
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e812e064de6so7068027276.3
        for <linux-coco@lists.linux.dev>; Wed, 25 Jun 2025 06:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750859724; x=1751464524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ok1Q+VndY6BL0FE9sE7eYDBp5x3YoFSF5XsyVPQ30Fw=;
        b=uZ7YgSxCEk7VbLjksEKPb/dlDhTP1+mcxKI3WciAVDoT/3iSkhHj6NfYFRnv6hiTZv
         Ns9iwbaPlQmk8W9us3/a3Wcwd3VbGHqpbpWfnqE4FeY21a0ov36spJ4BFF42R4eE+gsH
         KKXzh38Sy1rku2xThzVNjXn94g+n9oWaXUrkzgZugZRKVunpjuHKD1gkk0gPFf2uPRiJ
         tH0KCsc1/SKyfCetT79v5nzHpece+pY7/o3JYU1sdIEtJMkXjkk3gXIABPvSlmTd7pQi
         swHW6+m9xgNNdlhZ4juw0iai6mcX9olE+mNUAn6lPoYg9oZgAy7mj3UMcL1xZ+6IDwYc
         GH7g==
X-Forwarded-Encrypted: i=1; AJvYcCVjGda7IXCrXk/b9IfcRjBBoL4nZiPdVAd7+M1FJg7nIFsAmICbDEa5Ai015GTAqaYC+zdNqrOLfXGl@lists.linux.dev
X-Gm-Message-State: AOJu0YzdhvZvJrckQtTxr5XQmNJI2Rutw2Z1svhO4LNtVfPIP4eg5NUp
	56J7XbpAIp9+1hOvFhf5hLoH2xXgJcqN/1mYZsX0+HKvlmC2NkkUKGAPeK2X0yxLquqZZU4wTAB
	HnUnB4PuBBXB9JJtTemfZLR/Kh6wrJ+BQnik3tWWdbXkHEOwi60vMd9sJmckUm8MyNqRhnfSWyb
	VN0p0fG97muNaL1Tdps6jJAl8mT0NOK/Ub0UxXGSx5byEo37wBVlo=
X-Gm-Gg: ASbGncvAgB+wO5wGca96c4qKh7LwBvY0+2AEQeW3it6soFUcInG23bv+/2xZr03G/lQ
	eBZliTZhYcHDJdY7izRGXRML73jZDENZU9aFSmw220JcxNB+LqKZd0YTb4TIB0Btr/pmw4di/az
	t6j8H0cg==
X-Received: by 2002:a05:6902:1106:b0:e82:71ab:21c9 with SMTP id 3f1490d57ef6-e86019b8c3bmr3707713276.44.1750859724179;
        Wed, 25 Jun 2025 06:55:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQw2ajpaSaF2Qd44oWH8iXypAQELYkk8Md5Uv0CmZlSixukaq70icTpRiAXMob+6Igu/d4+Ud0AwyRdndX+j0=
X-Received: by 2002:a05:6902:1106:b0:e82:71ab:21c9 with SMTP id
 3f1490d57ef6-e86019b8c3bmr3707688276.44.1750859723759; Wed, 25 Jun 2025
 06:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <kf45vknwfpg2ule66cghubbzwdri4frjp3ugmybvfdkdyovqmn@q3hlnl34l5wb>
In-Reply-To: <kf45vknwfpg2ule66cghubbzwdri4frjp3ugmybvfdkdyovqmn@q3hlnl34l5wb>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 25 Jun 2025 15:55:12 +0200
X-Gm-Features: Ac12FXwrf1ch-VRrZmXlkFr7hnj-LYmKVv9BgtyIrbAMBYQ4adnSknMlAd5-CIw
Message-ID: <CAGxU2F41WRdj1d6e0E4_zgef8beafF97+KW_QFJmwfiT5RoJSw@mail.gmail.com>
Subject: Re: SVSM Development Call June 25th, 2025
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Pankaj Gupta <pankaj.gupta@amd.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lCXFQ7gpHrE-55Ef6gYwLbw0FT5AkHb4Xr5PmgyyJp0_1750859725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Jun 2025 at 20:34, J=C3=B6rg R=C3=B6del <joro@8bytes.org> wrote:
>
> Hi,
>
> Here is the usual call for agenda items for the this weeks SVSM
> development call.  Please send me any agenda items you have in mind or
> raise them in the meeting.

I'd like to discuss a bit the status of live migration that Tom and
Pankaj presented at KVM Forum last year:
https://pretalx.com/kvm-forum-2024/talk/8FUARR/

Maybe it's short notice, so if they can't attend, we can postpone it
to next weeks.

Thanks,
Stefano

>
> We will use the LF Zoom instance. Details of the meeting  can be found in=
 our
> governance repository at:
>
>         https://github.com/coconut-svsm/governance
>
> The link to the COCONUT-SVSM calendar is:
>
>         https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-sv=
sm?view=3Dweek
>
> The meeting will be recorded and the recording eventually published.
>
> See you all there.
>
> Regards,
>
>         J=C3=B6rg
>

