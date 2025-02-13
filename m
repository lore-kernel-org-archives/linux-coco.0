Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFAD204684
	for <linux-coco@lists.linux.dev>; Thu, 13 Feb 2025 17:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739468016; cv=none; b=Grc2gQdIuzcIgER1aRy+1nOtTw5lYicTB9Kc/V+79bTDV4RQsdYGdxftVaHTtHXlMhA4+hXNX3UB0jfVHGDXGaJa3yciife0tojq93jKGaJKCDIBYaixjoXZW54AlZ8z96s+LqSLUiCwVG7LDjcfPGESGtkHnBLp6J/lpATWxrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739468016; c=relaxed/simple;
	bh=IBE3DqvfPltRFsm3mBAK8i9sdVtPitaS7V/S98s+J1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSc/lA3ERIlebKJ5F2tU2P6SsG12ppTbWZMxqmMavDhLu8lAPWBfuZSWNHwNkfov2nigk+RRrVjdzUm0EMTEJ/18/OvYLnAk8J0UWmCOV3/45YoYxn8s5YYqNVloWuYEGeef6VT2L7T871j5r4MsLJA01WrKfrHyNecM9Y2sc/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R+w9QUFT; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R+w9QUFT"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-545092d763cso6735e87.1
        for <linux-coco@lists.linux.dev>; Thu, 13 Feb 2025 09:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739468012; x=1740072812; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGgVrzsAeNL3Ky4gN5+3YPP2m5D+SPcUN3lTNqfCOfc=;
        b=R+w9QUFTNeFGJPpGjDq75zNadOk5V39ZPwtoDoNjqclOKvpBIdzOd6YsxQy/XMyT96
         dr8YUFUxMRXlNryNlSJlWIqHhvj+siYj3tRZPrYXDWHyyMfWgz7osaEaZkMBbPqDReKn
         AjSYQwoOo1RfcO5MHjOKRue1LaXvsQuj9c04pJfzH3Nk1ziXkszyrSA7Kk0sGfN3tEP0
         /xlx61kRWOl+9EnbVImj7BAPDpfSefwIUDgeAXwtaitZDgWcnj7lyRXx3q88Dh86gBQg
         awGvgTKWFoGYlfvtXIZpaDdPFz/BppGJl4nbOZ+bPDIkDL2/snIOIzy36ggjDcJ4jRC2
         /Bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739468012; x=1740072812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGgVrzsAeNL3Ky4gN5+3YPP2m5D+SPcUN3lTNqfCOfc=;
        b=Xct8RQqQlaPmtY4vGH/E6E6r0t2hcnvvc6t75e95IyX+myX+IBShMuO5gJrF1FM5Xp
         8/6pPBD62ufd1SaX75s0eYxhyVrFtv0f6x2artIfWXi04x7fnSLn8wZgWkXpBpU8DfmH
         eVAWcsWojwI+IsKF7YKIiY1OjCiEZvceaypA3on95qxzAO9xmkpqQK5mBbjdsKws4wzw
         4TCXdWXbY+lKyV9Uf6rUGwUFam7wABuQ891umU8QK0q4zZdEXaKlWV7sgGKSVResDObv
         EMM760g+I3rv7aeIRVaXQqmGzrS3WX7tSainO/n48wi8OGgfmlPpSgp+D9mzJZFfDCqy
         /afg==
X-Forwarded-Encrypted: i=1; AJvYcCUqzXf2sX1skESCF3KuIS7G7VYmOQZmImrLhy4jY8hxekwF7N878cz9TEAt3ZeWCFrfzwGM0cWaNCp1@lists.linux.dev
X-Gm-Message-State: AOJu0YyNaGbJ1Ls41yYa8H/v6TxdLu4K3KaOzrpO9OLxAeYsKTEiiSVn
	mBttR0lE6P7BSbutQbnp79bgBq8LrqmcnUOUOZygxOnXgLEHEFza6XIV/PAyOPz6xkylamd4skR
	rlVjrBfc67BJTkeDdzFSyFcr/s/RDeMfLHHKV
X-Gm-Gg: ASbGncttl39jM6rfN4mQDsn3qZJFy8Mmu/f831JbNWV6KGEAzbyfknadrg4FKAnZ+C0
	pZTaE0zUHXlTAskc8SkxKKsWXIPQ7HV8WVGPGc09uUhnCNG82v84cXFD7/HLeARC5TuFWWqSemr
	BpSnEP0zmaMjaxDGPzx34bsxq5WMi5
X-Google-Smtp-Source: AGHT+IET0OV89iYfpu0mSYog4w1SQPmfp2RBaQSQSyY+Bufo1G9ums2tRHgQYhjw7LlG2MpjYEKfhvU+TU3OvVYN8WM=
X-Received: by 2002:a05:6512:1193:b0:543:e3c3:5a5e with SMTP id
 2adb3069b0e04-5451e020774mr343672e87.4.1739468012362; Thu, 13 Feb 2025
 09:33:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250212000747.3403836-1-vannapurve@google.com>
 <20250212000747.3403836-3-vannapurve@google.com> <ljdzupgyl2am4qgvirwpdonwuzwjaysemu43icrzxjt5olr3yx@dldbi5tqwhjh>
In-Reply-To: <ljdzupgyl2am4qgvirwpdonwuzwjaysemu43icrzxjt5olr3yx@dldbi5tqwhjh>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 13 Feb 2025 09:33:20 -0800
X-Gm-Features: AWEUYZlhzsA-Sl-KzuUXdz9zcP5QTmYOsipXxAYftqBemHGY7puDNPu9R37JLpc
Message-ID: <CAGtprH9OVVMXLyPnKXZ+K=S7XuPePHLwco0sXV-irGVj-SCbkQ@mail.gmail.com>
Subject: Re: [PATCH V4 2/4] x86/tdx: Route safe halt execution via tdx_safe_halt()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, erdemaktas@google.com, ackerleytng@google.com, 
	jxgao@google.com, sagis@google.com, oupton@google.com, pgonda@google.com, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 4:54=E2=80=AFAM Kirill A. Shutemov <kirill@shutemov=
.name> wrote:
>
> On Wed, Feb 12, 2025 at 12:07:45AM +0000, Vishal Annapurve wrote:
> > Direct HLT instruction execution causes #VEs for TDX VMs which is route=
d
> > to hypervisor via TDCALL. safe_halt() routines execute HLT in STI-shado=
w
> > so IRQs need to remain disabled until the TDCALL to ensure that pending
> > IRQs are correctly treated as wake events. So "sti;hlt" sequence needs =
to
> > be replaced with "TDCALL; raw_local_irq_enable()" for TDX VMs.
>
> The last sentence is somewhat confusing.
>
> Maybe drop it and add explanation that #VE handler doesn't have info abou=
t
> STI shadow, enables interrupts before TDCALL which can lead to missed
> wakeup events.

Ack, will fix it in the next version.

>
> > @@ -409,6 +410,12 @@ void __cpuidle tdx_safe_halt(void)
> >               WARN_ONCE(1, "HLT instruction emulation failed\n");
> >  }
> >
> > +static void __cpuidle tdx_safe_halt(void)
> > +{
> > +     tdx_halt();
> > +     raw_local_irq_enable();
>
> What is justification for raw_? Why local_irq_enable() is not enough?
>
> To very least, it has to be explained.

Let me replace it with a more suitable arch specific <>_irq_enable()
function in the next version. Intention here is to just enable
interrupts.

>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov
