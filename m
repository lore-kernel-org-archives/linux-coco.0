Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF82B2E5414
	for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 11:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753441756; cv=none; b=T3CjLsRalrziby23jsxKsArdoypvTBRqHfNxc8pbkBPEXV5Bh9ghhZTIFDyo+E3c8kvLHDdTGD8XKmJEkO2tFvwUeaCNj18qf5OAa4JMWbwG2L4d3rpTSCtjj0uPHSj+47pa53bLxmPlvIIg83X74TZe4Nfqy8EmffqJFMfnMcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753441756; c=relaxed/simple;
	bh=r6TFW6LEnDFDgljm7T9nclsKj7smdp/z2thlL3Bp7MQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=km27GBAp9M12+gVvCVV978gQRmORYYjE40Y4FQcI6PWlNQ2EB2sT1sDTu+QE0KsrtOGaCU1p/yvWX24GHK5/rrI4pyJDbfX7zQtcpWRHfm3tgg1BQhb4QMrggGzauknVlkWcXj1rl7Zg1hCiPdx5/B4uiG+XZ6qzbQPW1opNO0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkoQxjM2; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkoQxjM2"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b3226307787so1707158a12.1
        for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 04:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753441754; x=1754046554; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4dcsgHJsiFuB5DH2cQD4a717boBYqK/NeHn/u7KI9k=;
        b=hkoQxjM2YSs4H5/XyBiBPBNlevYQn1RmRCP0XRhX6vqliGHEQYWgp7izrqlZGQsEfp
         xfa+gCCpKhTcZqU/8iPNDHZbfA/ysZR3JwB4jPr2t6bssaw+u2Cl/laZFqSrv98WtP0r
         JM7Tb/rnVIfOkvw4sCEmuFhf2qY4ZdFpDT6RHu/Zykb69U0sb+eEH2Evnqq+TQSlDFeF
         blK0bnb7tYLlyfLA/wEbZm3bLieBLGf3bQmMz5IXPAJzYRHaKJs01LfGWa/kLgScjVmb
         CETfSpLYNSMdBkn7gGGQaolgEQX1q1M75+ObX2/enQ6wVtR+DN+1jKqN2Are9Ex3DJT8
         xEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753441754; x=1754046554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4dcsgHJsiFuB5DH2cQD4a717boBYqK/NeHn/u7KI9k=;
        b=nkQaXELYncemVqZ5yCf4BnVIXnqFKRn3zXPb5rvrhb57+PjeW+L/mMANQyKMTL3JIV
         h+Wg2ike4MA73ybffV82AAB9ups8hA4k+V++n3zPYy4J4kVg5dblja1vovW29g2sV1sN
         uFhvtffJGPshOoJ6sf4/+c3xIXiXiZrhOW72KJoQbr6zoD6zFwc5sxML+R4Cu+VSkHBd
         TvwN2Ig5M/T5VioBLra/iBDPEWd9ZTn+v+I5ykWVk00kdbeG6gntLPTubkUsTk9W/Z4e
         B76DRZ+TGNSMSkOukZFnshB4g00iA0lVrp+WNCMwgZY+go3BJUktUh91YxYni1mEsENc
         V6SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIlP/tCKGSJOlvYs35QlkWUDy5GuVqvONYra9wSNuyv+/cLrPd7NruhKsSt8wv1JS/DBdB/6ZHgD5m@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/BQf2VdN1DPIdhmsGESJJy9f/7535DNsLMsdSK5MXraDQaEHS
	aw9CE+cwMWWE91V+F7wiZkqfoqUEA4c6XRo+M62BGlUyI07Nxt7ytmcLtQPpLMmqAmDcqIxPdrw
	MmxQq47YqVhYFtG+GrgLh6kiZL1oX94c=
X-Gm-Gg: ASbGncsip6nc+X2WcZAvR9SW4yrMCzLqyzTSeVD+xHlxuSzcTO9e88A5Fud1IQH04Qb
	9KNhXW0Oxm0KxCcZ1mBaRkmKETwfS2flxsbB/2SGslrXW8rK0irwuN7NttCQ9jvBXEJ6On0JFyn
	AklDqjR53VhaZ5ff3tVGzXk3WIRLtBDsOjByAoNrtvAMCUgahgK1K6LFpQdcB2nj+rXxD/dL+8O
	8C3
X-Google-Smtp-Source: AGHT+IHzc69ul6W9dr1PZNQjrkdeeaQAbz/elxAykodnDXCU37bqxvv59Sf0g3PkwZUP1bQTMcpl5i4V0RAyNvW6vGY=
X-Received: by 2002:a17:90a:d40e:b0:313:1e9d:404b with SMTP id
 98e67ed59e1d1-31e7783b3c0mr2460183a91.2.1753441754040; Fri, 25 Jul 2025
 04:09:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714221545.5615-1-romank@linux.microsoft.com> <20250714221545.5615-9-romank@linux.microsoft.com>
In-Reply-To: <20250714221545.5615-9-romank@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Fri, 25 Jul 2025 19:08:37 +0800
X-Gm-Features: Ac12FXzPuW-X6w99YdkxRL9JtBmW1hyu8BbtCuoFQLmf7Mp6jVRHMfrBCkYMIAg
Message-ID: <CAMvTesDEqDKXdFZ6+k6nrvEx-9+HQuC_dOdmoN5SqXmoCEKNXg@mail.gmail.com>
Subject: Re: [PATCH hyperv-next v4 08/16] Drivers: hv: remove stale comment
To: Roman Kisel <romank@linux.microsoft.com>
Cc: alok.a.tiwari@oracle.com, arnd@arndb.de, bp@alien8.de, corbet@lwn.net, 
	dave.hansen@linux.intel.com, decui@microsoft.com, haiyangz@microsoft.com, 
	hpa@zytor.com, kys@microsoft.com, mhklinux@outlook.com, mingo@redhat.com, 
	rdunlap@infradead.org, tglx@linutronix.de, Tianyu.Lan@microsoft.com, 
	wei.liu@kernel.org, linux-arch@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, x86@kernel.org, apais@microsoft.com, 
	benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 6:16=E2=80=AFAM Roman Kisel <romank@linux.microsoft=
.com> wrote:
>
> The comment about the x2v shim is ancient and long since incorrect.
>
> Remove the incorrect comment.
>
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> ---
>  drivers/hv/hv.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
> index 816f8a14ff63..820711e954d1 100644
> --- a/drivers/hv/hv.c
> +++ b/drivers/hv/hv.c
> @@ -266,11 +266,7 @@ void hv_synic_free(void)
>  }
>
>  /*
> - * hv_synic_init - Initialize the Synthetic Interrupt Controller.
> - *
> - * If it is already initialized by another entity (ie x2v shim), we need=
 to
> - * retrieve the initialized message and event pages.  Otherwise, we crea=
te and
> - * initialize the message and event pages.
> + * hv_synic_enable_regs - Initialize the Synthetic Interrupt Controller.
>   */
>  void hv_synic_enable_regs(unsigned int cpu)
>  {
> --
> 2.43.0
>
>

Reviewed-by: Tianyu Lan <tiala@microsoft.com>
--=20
Thanks
Tianyu Lan
