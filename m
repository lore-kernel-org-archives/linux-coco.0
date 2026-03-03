Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B020A3932C6
	for <linux-coco@lists.linux.dev>; Tue,  3 Mar 2026 21:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772573960; cv=pass; b=e9h9gGO8oRMGSXvrxems+uYpE+UxCbWCmZq5I6JcAxx8IewNThEtQL5wMF2cv/5ru4hz0TmD0BhCzFeMSjLX8ToqYxMS0A+26yTqwn8+dcsF1yNJ7bU2ncYdda/ZqbWGf5ySpbPyBnVYP66mA6a1SEvp3BOP6f0jx70mPv+8O7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772573960; c=relaxed/simple;
	bh=fFAElkF7CUR60GDJaFO5zfK9HienfC7eKeiuvWcR+Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TwSqXh49Z7P2Wwz2XnEE0fN0X2zD6kJKPTkdsmq8b4P+pK3ZRntMKLOXjnDdYs5i4lAcYIHHnGC5MDovnXqwFrQR/V0Iz1MmlIlJAvp+XwNXDcmmbTepByEbdUyv6jdeOn7tcgP2WbVQLpgGuDU7tvKMlPwcJBopHra+1wWPR3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ed/YbciV; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ed/YbciV"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-506a355aedfso631701cf.0
        for <linux-coco@lists.linux.dev>; Tue, 03 Mar 2026 13:39:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772573958; cv=none;
        d=google.com; s=arc-20240605;
        b=GcIDr7eIj2ddqaKLK5aoQG+7FtnMLzVE02WwktorU6qQ4PDTP0UyKbzY+Zc7dsRTB/
         W/mPYRi9xyUfQHp4C5TRGsZ3E5HK0XiFPIWhKy038LSTayH3lm6A5vbUdUlTSwtdkgPc
         Wd75xKM/ZxK3XpEQeWNPE2+nEJpVhifuPYTauM8QxyAMSfr9hfQBRIugd6Zb1x8uJQ1W
         uU6vam9as1BZEG2+S3WwNlgG+jdaEgEDYneMLoBMf5BDaw+PvH4kvdq3VFbOyod2wBLo
         flhg4r0yPcb3IysE7XnQ9lXwvt8nbi4x2nNsRZjvf9pw42OjjmdhIfamRn4HQLfWPChF
         yYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bcnZYXl2BjJMuM0/iADjl1cewrDesHr5oW+IPkJ8qks=;
        fh=dHrDT+PQunOAXGZ6AISLydSQ/srzoHNt7mkfrSJ9Ryg=;
        b=OjDB88Qia7buwCVRLu1t9dphA/61lrLNPVT6zluvCm7W/PBpTXRe8iKNFhFxXtJdfp
         KWVQY9wDyP6HWjAKKEPwHpAdN+ZCXd4cWxSvidTdm0OTi2FaCj/V5cQIeSppZurU9Twc
         PfQJj5g0U4xKTfrJ2c3wyNXC1uJsVCJDgLlscPYa+U16sr/aGN16ZIQRKtpdfrn492fs
         DXaZAUVxjkrQqJKt4Zq34hKnYKQR1yj7YrwmUPB4phGpRDwP4i2MNipQn7QUW9ZuRzL+
         FIAUhD/vyXbAK5rnEIJJ3MV7+/Hh8WbD6YJTfLtNP+/AulZT1iQFK5S3Q4KQN20sdx6h
         25Lg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772573958; x=1773178758; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcnZYXl2BjJMuM0/iADjl1cewrDesHr5oW+IPkJ8qks=;
        b=Ed/YbciVfJBcS+kCdoCUo+LrXHV93d52f2FnsL0cHCw8urFs3thD3aQ6dkfuXLSxPm
         x41qv7KNRe6dU+Rl0+tNaHyuBgTafCaNvK8dn5fd4+RBvJMkiagzbJ87+zb1qVQma7Tc
         ad+CX+QVoOkY/4RUwsnh597LGJDw5MDrnP1T5lF+0E+XjFoC4TYhZvgpyu0dcaHReKMh
         WZXdpIxWlLSxvVBphV166Zvtz1hhCtS18KIcKXy2htwsngVKVetNMGVQnVYd3VrEmN1u
         B7PrCYLpzlCAmmOq6BwUOm4J7ANcXdyn2UxtDZcJu7dbesL8XpeV13WdTTvomU6viHNV
         Y7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772573958; x=1773178758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bcnZYXl2BjJMuM0/iADjl1cewrDesHr5oW+IPkJ8qks=;
        b=TiFb6LLFyhNYpZZA3mG+yjoHdhIwGBuGSgk3axK1xC1PO+zbJ24FLQTS9ycLJcc65R
         xUt1ZQWvOzENfJ+xAgXKg8WdlVou/qbGVaTG8NLADVCcxJFGQssZq8i0w6lTuUHTdq8j
         6+opfMy381mV2DrXjNnUYMtTAoruMchf4/oa9bucerJlreUsEt1KAwirSrgIvQIqOE8C
         +e1OblzRWBAF+wFJGW84aT2JZQ5DbnsuaUBK0ejaNoyEeeGUgggHhMI5SoD2t39E2L7g
         MFUZ9AlWHmBIbax+PTNK+U6mDtnoXW442L+IxHKMCmlQMrfqYJIRhzbwJ/hpsagaWzmP
         UCWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXipre+E1A3SwtZWXQD206oPiUtszFdDIcR+ex0Zy4ofoPH/aOkU7kKQbjPmXPrP0x8DRgRiHDCiv5U@lists.linux.dev
X-Gm-Message-State: AOJu0YwYjpZeAcM9RDirgv4RpWRPpgLLZn/xLD5DjqqTJhTimWZPnlB4
	GzZxsvEDxPHATfnNQRFbngmxWBFI9U1aA1RCV+KCKEjVcKQUv0tHh/dMhjBoXrwIxcpaQ/BC2Hq
	v8G/mRwZtPsyhIypfplDN2vGFXFudXRRyz88CdzB/
X-Gm-Gg: ATEYQzxVuYScrWB89O4blOIM7oQOuoZ+mNeoe0wFnSaIU7mAnw/3W8kjVe/6ma6mWRa
	i+0/xVsj9mQTXCh+QzOtvczY5I+EaVgA3poe7uX5GeqYLkbC63b1lLCofnwiV49PCbiYBG19Eqv
	1yc2k6D6UKNb6vSy7T1aOoR/UEo32A3Gv8hfJwTWBBuKFBbsblCgReGd7nBpn3Nft+RzI5qyIn/
	CY5wpw+7/6Guw1kOgNbEbAGHiFUUUQ3eERhuLyCfYlrOgMmcEgfIHqrsY6ksPmiA1AaWpfYNOBi
	Q6ocYPDO7n9FCRq+3IafUT66Qne5c9O5RiPWT13v
X-Received: by 2002:ac8:5dd1:0:b0:501:3b94:bcae with SMTP id
 d75a77b69052e-5075fe651d3mr42016611cf.8.1772573957041; Tue, 03 Mar 2026
 13:39:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260214012702.2368778-1-seanjc@google.com>
In-Reply-To: <20260214012702.2368778-1-seanjc@google.com>
From: Sagi Shahar <sagis@google.com>
Date: Tue, 3 Mar 2026 15:39:06 -0600
X-Gm-Features: AaiRm52vA8aXyZ84QO0eVPVcndLPd2lZR9vVhS9_WQuv-P7okwod2ZXFImZ6Qdk
Message-ID: <CAAhR5DF5BAcFO2tj0H63ZoRCcdpDS4Jw9XzqC=L2xWMW0M=0QQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] KVM: x86/tdx: Have TDX handle VMXON during bringup
To: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 7:27=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Assuming I didn't break anything between v2 and v3, I think this is ready=
 to
> rip.  Given the scope of the KVM changes, and that they extend outside of=
 x86,
> my preference is to take this through the KVM tree.  But a stable topic b=
ranch
> in tip would work too, though I think we'd want it sooner than later so t=
hat
> it can be used as a base.
>
> Chao, I deliberately omitted your Tested-by, as I shuffled things around =
enough
> while splitting up the main patch that I'm not 100% positive I didn't reg=
ress
> anything relative to v2.

Tested running TDs and TDX module update using "Runtime TDX Module
update support" patches [1]
Tested-by: Sagi Shahar <sagishah@gmail.com>

[1] https://lore.kernel.org/lkml/20260123145645.90444-1-chao.gao@intel.com/
