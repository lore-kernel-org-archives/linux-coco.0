Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37CA1E2843
	for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 18:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738175773; cv=none; b=hlrU+uj17T11A6CLssy8yoSx4dhPd8snPB2vbu9FyBUUrRfcsDAn9MVTpAukcJHroN4hzZgjRgK0um2H4IxqwDLREoHJLNo7gPB3ISOkga8jE20VDsWBDPD2v/O65fTAVT3fMf/CpVb9LTvxi3G6YBofq8gEkEngzYQdjRPMj2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738175773; c=relaxed/simple;
	bh=Xq6f1VgmDWn5aSkDLSE4hseUnIhrvhpSc0MgefCHqTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJG7xxUACkGs+UXKfVf/yoBoOW+K96Z+oSyHzo+hnQ0trxGiBUDpBlZZYPCkp5HF+uqvDdQXdyTMMpRnWilah9GcAcvgFSzDBQMNyWdD7f/hQPo2aXDWVgSj1W632G/4tFz9uK2NxatWKM9PIlU3gRkFQRZod9zP+IxVV22/ozU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AHKYfltz; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AHKYfltz"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e3a2264e1so645e87.0
        for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 10:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738175770; x=1738780570; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqjEzI3JyTEx3ZTozRjpbk7/EoIe+bijn7jTt9DwQA0=;
        b=AHKYfltzdw7qBwCdy4QKN0JMIcqFVx8bHznAF9Lq03/cJkhRJWsX/IeO8MmUsPpbWP
         ItAcReYkd52KQBe4447pTmDAEN4qyTmpR+joHbE0/6bypQI7+BeigTvJNd70OvIz9Iyv
         /APsjhvQYouIWUefIoCr4mp5zzfqZmGULFnJzgn6znL00zKMsrbheU9pZpi9/rl3LKqD
         NEvnt81S4gOG5MiKiWsCcEdGKkpDDqi7oZ/MkaRMp5ynKZXdCD5YCaRNOWiNtz+wwQDs
         fJunsCkH8GM4mCLMFjWbrnQIqLLVEOwBNUb4270OONVNRyHmdEE8T5UN1XMEHV7sjnjY
         a3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738175770; x=1738780570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqjEzI3JyTEx3ZTozRjpbk7/EoIe+bijn7jTt9DwQA0=;
        b=DadAPowecJMrjRexLDjLC2zZdPa0tzpe5SvXv6OEoh0Vqwb4n3/r+FKUYiD+2RUUP5
         Tz607leLNu29WwtT4VCBKMMfrayrznUydvTGhD7BagB/VDQX49DIIAY0C9jPmYgOgkMC
         ftc5vUraGbxVN9hOfcWmBbCnsIhBAOtE5zugI93UWJEV8WzfHRq9QDyUi3HGn9zxmiHR
         hAVE9l3ejfoaZpnkSLw1KzQfccM/iO8LeMvzrIQOZv81KGnsagwLnVB471VFVzx0rbdg
         SkffIpDoxjC2e+8KEwrLXL+e1cnLuoNt0HLIQnRG3xsz5IqTDWNwJ62CEstIphmvmDzs
         Sd+w==
X-Forwarded-Encrypted: i=1; AJvYcCWyTKSx2Wc/mgJjVjEDVme91INOdf5ywUHF/Kq5tuykv1MlV8QvlZr9nmHQFIejbb2bkpNIyqhU8nj9@lists.linux.dev
X-Gm-Message-State: AOJu0Ywllbr+LMP2Ud2YDF5Fea+34MCl8Fwj6PluOL3cT09cG8vu7czS
	CaCF/jfkKFtN2saIGxrgD2NT95r4y6GiflF0vHl37qm3PP5F4OoPqaaHzoMNUmYOAGJL//Z4bFk
	y0z5HONxuG7FJrqdie5xMG746nCrUHFzwAgNd
X-Gm-Gg: ASbGncu1NcetCOKD+VpkUQft7Bmv3nQkyBY9mT0boRSFDavRp1bYLcrhCIWV93938GZ
	sneBYgkftPyGgHFr7BNoRIcfdJPPHErDYJ2lN9xk5VWvy0Ez2SX5hawq607nzbuwWSKDz4ME9dJ
	X9iRTty64nNRdGkv2mTVXsFxE=
X-Google-Smtp-Source: AGHT+IEaxVpoTZz2vvLQoRHYpSSYaUmVzpFsNeonjDND8BXCSX4yjfHvPD46R6vIr1m7DgQtokCSJk9fW7h8ivJaTEw=
X-Received: by 2002:ac2:4356:0:b0:542:9910:b298 with SMTP id
 2adb3069b0e04-543e5476f8dmr200608e87.7.1738175769784; Wed, 29 Jan 2025
 10:36:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250128213652.1880545-1-vannapurve@google.com>
 <4e07bbe6-9f74-45e5-b8d4-f992d2be78fc@intel.com> <CAGtprH_1hc35um_47n=TMJzXAvpa7LY6kyXUafjJt3sPCosC_w@mail.gmail.com>
 <Z5l6L3Hen9_Y3SGC@google.com> <slfw63tenzxur6fvfjf6ni3lp2exqcpzodgetx6p5eqchw66y3@oqjvn6ezgmod>
 <Z5o0fZouJV2Fqe7b@google.com>
In-Reply-To: <Z5o0fZouJV2Fqe7b@google.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 29 Jan 2025 10:35:57 -0800
X-Gm-Features: AWEUYZm4D6rQCg2uG7L_LEbrzQWMBzZEnqI5W6C9QIwDr33R9NwZbD9nAQOwu0U
Message-ID: <CAGtprH-z8bgHQoLiTjnVNK7AK9p0CioFHRRdCKOW5g6j7fO=4g@mail.gmail.com>
Subject: Re: [PATCH 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt
To: Sean Christopherson <seanjc@google.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, Dave Hansen <dave.hansen@intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, pbonzini@redhat.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, oupton@google.com, 
	pgonda@google.com, dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 6:00=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> ...
> >
> > I've asked (some time ago) TDX module folks to provide interruptibility
> > state as part of the guest so we can handle STI shadow properly, not as=
 a
> > hack around HLT.
> >
> > The immediate problem can be addressed by fixing the BIOS to not advert=
ise
> > C-states (if I read the situation right).
>
> No, something like Vishal proposed is a better fix.  It's still desirable=
 for the
> vCPU to call out to the hypervisor when going idle, otherwise a vCPU that=
 is idle
> for an extended duration will never let the pCPU go idle.

I think Kirill's suggestion will ensure that cpuidle_idle_call() will
invoke default_idle_call() [1] which is correctly patched to call
tdx_safe_halt(), instead of using cpuidle driver subsystem. I am yet
to vet the ACPI cstate configuration for TDX VMs, but unless there is
something critically wrong with exposing cstates to the VM I think
it's better to handle acpi_safe_halt for TDX VMs.

Until there is a better solution to emulate the "sti; hlt;" behavior
for TDX VMs, it's important to deploy warnings as these scenarios are
easy to miss and hard to debug otherwise.

[1] https://elixir.bootlin.com/linux/v6.13/source//kernel/sched/idle.c#L182
