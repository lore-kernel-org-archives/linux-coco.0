Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D2019F131
	for <linux-coco@lists.linux.dev>; Wed, 11 Dec 2024 16:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733935343; cv=none; b=ZSe9T+2XSLW+FDe7/tLFmq4K5pONsz+4vK92F4h5iES/kUbIEBGaSQNzHzOIGFVC8v8Q2zT6Ms5pjpfthHRLTF1PM3jQnpFqQ/1Ed5eBnscHmTYlYcvr6JV8QDZzdV1XpdcLDgV371JgF/CTIBB1wMq2IfbeUDzTLYXtCaY6u7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733935343; c=relaxed/simple;
	bh=ZWKFASmhjwAGqbYokVzWZLsYyd33PT09aF7jLzAdQVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=avDEusUzN8NLvYKUcM/33O2R+zHakTj7zwL30xGoWbhAZaTZOiBEdiqDKh+iMeEGDDz+4wYKAN9OudLiYIaUtZThJSdImcu++Z4E9GS90K3GZo/yfB1IRsAuYbIL7munml0wLEmKV7YtTwppDp3zcBRffx3qIQdj8v8z/h6pdcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JY2pSXAS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JY2pSXAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733935341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWKFASmhjwAGqbYokVzWZLsYyd33PT09aF7jLzAdQVw=;
	b=JY2pSXASOrpz+m7zLAZ6vJTsBK5BsakvqXmDhdkKZmzKIX4IZDYrVpiFMuBZfHvWP5G3Lo
	cO4NQpJy+8j9xP4qIapFwWxvMk0lkQqBLvwKZcd3EAQwCjMSS4rnb58CY0iBHl2p+mEWkY
	NyIDzOOsiRspvv0dhn0Uyq9/w92ZH7c=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211--qGkTS40OkiPr9ljXYGJCg-1; Wed, 11 Dec 2024 11:42:19 -0500
X-MC-Unique: -qGkTS40OkiPr9ljXYGJCg-1
X-Mimecast-MFC-AGG-ID: -qGkTS40OkiPr9ljXYGJCg
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-6ef7895405fso77477817b3.1
        for <linux-coco@lists.linux.dev>; Wed, 11 Dec 2024 08:42:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733935339; x=1734540139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWKFASmhjwAGqbYokVzWZLsYyd33PT09aF7jLzAdQVw=;
        b=B7RQsjd3i+3PjPqLkJjvWsX+dBn9XtMeghTY0IaW14vvWUOZBUguqCZcqMXy9Zbl2T
         WcfhybQGQNtTBf/FDGRHln3/OUsFRrxXobF9OjCU1mrGJoXeS9hM7EdgMN5m2YZNxVSf
         DIBBvtyXf0rOmZR5etuqXyAx/wzcRb18y2WFBUV0nPUvzTgeLOisLyk8eZWks3TEIi7m
         I4ZbmlrffEggOnFkGT9WTHPVZ3sZfYPT/++PtcrImY+st6X3ZCdMIEOkOdN7iY5lm2TJ
         vtQVbLGyX4lu5F8vPis7k79u2yhYd3evsjveZlu4c42uI1pWboGGYuyg3fFtPcQ3CjXb
         Gypw==
X-Forwarded-Encrypted: i=1; AJvYcCVp/+OYAmdfhdAwgwzsAVSGnVrzT71pc/JbFxJZhIg3Lly+Nmwqddbc1+3s9GjTrHIhBmZ9S9KjNpUD@lists.linux.dev
X-Gm-Message-State: AOJu0Yxft67YuwXJCmKfXFMcqBB21TGpVRSPEpYs5hU7OU0ChbjRb80s
	UICziM1J1SmUpriceWkTLshXpYVHofCRxMMLHJfNyvWKPc2NY0UXhWWVzWqJE3pbFytGePzK1Jp
	/xTCKxQQyqxYO137GMNp0oWpNF+1wHpZlJ9kV6BR4YVX6S5KlYr6bIrFgsjPrxVI1VY0XJwD+r2
	IG0rzFrT6puHTMM/XRcEyeQMwR/rSoIqgKlQ==
X-Gm-Gg: ASbGncvCeh1x4U/raSAow7PYdjWuUXiigYNSGObPDA2e+OELGnfq8XXulmm8zMEgsaV
	+kgX3ipk5jP06/WbNI6B98d6saMapYvYMmw==
X-Received: by 2002:a05:690c:7209:b0:6ef:4696:f1cc with SMTP id 00721157ae682-6f19e507948mr1535037b3.22.1733935337419;
        Wed, 11 Dec 2024 08:42:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/XJy9SvqHMi5QS9auWTLUBW5pkqCymbkP9cFTfBTmSyV+DzOhB5ok1fIsYYsnyOBoX0jGlj/OTH7H/+3usaY=
X-Received: by 2002:a05:690c:7209:b0:6ef:4696:f1cc with SMTP id
 00721157ae682-6f19e507948mr1533757b3.22.1733935335549; Wed, 11 Dec 2024
 08:42:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241210143423.101774-1-sgarzare@redhat.com> <20241210143423.101774-4-sgarzare@redhat.com>
 <20241210144025.GG1888283@ziepe.ca> <50a2e1d29b065498146f459035e447851a518d1a.camel@HansenPartnership.com>
 <20241210150413.GI1888283@ziepe.ca> <CAGxU2F6yzqb0o_pQDakBbCj3RdKy_XfZfzGsiywnYL65g6WeGg@mail.gmail.com>
 <20241211150048.GJ1888283@ziepe.ca> <CAGxU2F5NSqMbA1Lep3+16GoZXR23q0OP8dFVVRJ6DG5sF20R3Q@mail.gmail.com>
 <20241211155358.GK1888283@ziepe.ca>
In-Reply-To: <20241211155358.GK1888283@ziepe.ca>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 11 Dec 2024 17:42:03 +0100
Message-ID: <CAGxU2F51EoqDqi6By6eBa7qT+VT006DJ9+V-PANQ6GQrwVWt_Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/sev: add a SVSM vTPM platform device
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, linux-coco@lists.linux.dev, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Huewe <peterhuewe@gmx.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-integrity@vger.kernel.org, 
	x86@kernel.org, Joerg Roedel <jroedel@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OG-f5pSZrhJlk2LejkjHy24EmxSkQymg81xG9lEBnYk_1733935339
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 4:54=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Wed, Dec 11, 2024 at 04:38:29PM +0100, Stefano Garzarella wrote:
>
> > Except for the call to pops->sendrcv(buffer) the rest depends on how
> > the TCG TPM reference implementation [1] expects the request/response
> > to be formatted (we refer to this protocol with MSSIM).
>
> Make a small inline helper to do the reformatting? Much better than a
> layered driver.
>
> > That is why I was saying to create a header with helpers that create
> > the request/parse the response as TCG TPM expects.
>
> Yes helpers sound better

Ack, I'll do in v2 (together with send_recv op) if there are no
objections or other ideas.

Thanks,
Stefano

