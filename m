Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5401C221552
	for <linux-coco@lists.linux.dev>; Thu, 13 Feb 2025 17:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739468447; cv=none; b=G43l6cMKr+LbcNNyHAk97t89kBMRMo+0dAYHZsQzGesHAW96MpzV17p+inZyL8XHg3ybxFonleenYaU3/ZlOxXXcqJefHMw65cPt7SJpnp0TnZ8E8gKcLtRvTzE0nr35AGdofTTeswUCknRAF9gSy1G0CdBCXgR5k+BnC/PMuRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739468447; c=relaxed/simple;
	bh=PJn/xWyVQP+NbgKG1/5cj+3Ej4/TjwfE7JOTLbKKggU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3kysxn0b5dOi8ivdRo6ZPTDkaTXcn/5PUuFD+HGKE3ggThX32jDCaul2+9GDkVjnTMnoV2dYUdw0i38QcrfF1xpTyvN4aQV2cCOWkYstfT+CFhQMZzaZFRhylHDckNKbg3dsuQXdMXLY2fpWbApL7/hB3HbbrBal838kknOEnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FI//lPBx; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FI//lPBx"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-544043a21eeso7379e87.1
        for <linux-coco@lists.linux.dev>; Thu, 13 Feb 2025 09:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739468443; x=1740073243; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qI0uvgkCUAQzUsKPd2Q1CMBy3nXX2t1tLsj93zCjWX8=;
        b=FI//lPBxfQXmuuF3shA1BpiCl/fmHEC9d8bdcNktagvgVWAlPGuvMb1SfQpngzVpd0
         ZtFOPuTGKUZ07SWawwWu6ztd7+tGJ45FzrgbepAnHo7B0rC/7/aAGed2zMf/ZnXDyPPk
         p/mQibBdQ6qsjRouOsJbeIqeQ2C0F7u70CwdOmvfDxqMzyT9V7l/RYzSRVlcgwwd7Hx3
         YdmqufNyQ6dkcUrAlQjhGhzn5wSMvT1ZJeK6+XM7Md3SkeP+tvuNt9K9S/0ZT63fyUL2
         6jXvDcV0xddF/Hlo244PIHtY6raKbK24XczxZOshmn4JlRG5jscS7RIbQrrBDrktB2d1
         NUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739468443; x=1740073243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qI0uvgkCUAQzUsKPd2Q1CMBy3nXX2t1tLsj93zCjWX8=;
        b=SPDxXHhq7gZs8myrZu9zozW53LTM5/K//7cyk9cPptJqjrQ4SWT19P3FYjmRgQ9chS
         453dDwCx3mJ4Ea+bcpBuvk1VRrg9rg33o8p39J5qd6ADMgQPD/7mL+/X6QQzp7WtQHhr
         c1uZtfwiRvuQPu+P0iUmvdnNWD9gNuLCiPzK6ZOiQqPdG/fYPiqbrBRMNslPF4ImTgzm
         MJ0/S2GyjyJ+0fKbK8YlzBXOw5GlpHrIFwYSeP4mPQSm0O7tCRMNaSYRWE2LUOnYwFcF
         S+tZ4CVrh17NkBItzeVrtpQwmOk8fb9jH2tomAMhatFVzBHRjVW4swLxGSF/y5gUIfVH
         msLw==
X-Forwarded-Encrypted: i=1; AJvYcCWo3VbMJQ2w1+G0x+k9Q6xySmGK6rxXbq6DwWde/ul0rqsp94l3tzz/o6HJw3svdC2ZotWK1fYefnRF@lists.linux.dev
X-Gm-Message-State: AOJu0Yze87h0eYnkSZbjq/SvsJ6fpWSxYFaqkMNtKihggu3+1clB/oew
	EjDNvr9YEiIXvhXZZFitnnIfjQrtLY0DCu/v46amawbptFm8eU4V5k3sM8Vh+Q51iUSAQp3XmDk
	2RdtJqrReeDupEtnA7NYPyCf7CG6aMpSjqF0W
X-Gm-Gg: ASbGncspgn7ivmNJrrsS56LZjS2/G2M4C+xHkewyYk+N9w0dqoJxQex2J+TugD8kHFy
	q4siDdF0itpWQ+ompjt6HU8Sv3zsrpQUwYM/Mw/ALP6D19plPah0RQsfRhlqvMl4xURPo3ItNre
	uBlDAXVsXhq3NXAXNcs30Ul+rhXPjN
X-Google-Smtp-Source: AGHT+IHCscE0kQcny+7+pxlz/JKjpDU7Xmel9GvNySr8+k+ezi8pDuGOWCHVRqHYoHCadEroGET+4KmA6Vqca8S/8aA=
X-Received: by 2002:a05:6512:118d:b0:540:2543:3ea6 with SMTP id
 2adb3069b0e04-5451df69611mr324234e87.0.1739468443175; Thu, 13 Feb 2025
 09:40:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250212000747.3403836-1-vannapurve@google.com>
 <20250212000747.3403836-5-vannapurve@google.com> <avodert2s5di3s4m3ays6z4qhskwfz6zxenoq3rsf7crpclkfz@jaq7ptkmco4o>
In-Reply-To: <avodert2s5di3s4m3ays6z4qhskwfz6zxenoq3rsf7crpclkfz@jaq7ptkmco4o>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 13 Feb 2025 09:40:31 -0800
X-Gm-Features: AWEUYZkHJzqGHOSRVIe0nepyd4-5c6NKDhi4t8FPJvlO1zoPxUpzsf7BIsKRtaw
Message-ID: <CAGtprH8Ts9ScKUTraw-V20mLvdGjT_ggZCwWQD393KgfVa1nNA@mail.gmail.com>
Subject: Re: [PATCH V4 4/4] x86/tdx: Remove TDX specific idle routine
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, erdemaktas@google.com, ackerleytng@google.com, 
	jxgao@google.com, sagis@google.com, oupton@google.com, pgonda@google.com, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 5:03=E2=80=AFAM Kirill A. Shutemov <kirill@shutemov=
.name> wrote:
>
> On Wed, Feb 12, 2025 at 12:07:47AM +0000, Vishal Annapurve wrote:
> > With explicit dependency on CONFIG_PARAVIRT and TDX specific
> > halt()/safe_halt() routines in place, default_idle() is safe to execute=
 for
> > TDX VMs. Remove TDX specific idle routine override which is now
> > redundant.
>
> I am not convinced that it is good idea.
>
> It adds two needless flipping of IF in the hot path: first enabling
> interrupts in tdx_safe_halt() and disabling it back in default_idle().
>

IIUC, the aspect of flipping IF in the hot path twice is also
applicable to default_idle() that gets executed for non-confidential
VMs. I agree that it's redundant for TDX VMs and if there is strong
consensus here, I can drop this cleanup in the next version.

> --
>   Kiryl Shutsemau / Kirill A. Shutemov
