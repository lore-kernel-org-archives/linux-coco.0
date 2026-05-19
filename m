Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65B121D3D2
	for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 00:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151507; cv=none; b=koBaMokWU7x82VoehobAbY1F8MJwmaN9vSTsRsppAQbWjN7Wl0GxtdMCmiWZQmugFoKzeX2O8pPOg6nkyhU9KnW3nNrjaqybhceEgcjPmC5jNisjIVquXddyLmDgTU1a9xSv8NL7KdFeGYpXc6x93bsKRCyMKqOCv5tiewyIH6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151507; c=relaxed/simple;
	bh=DJa6+wvn4O2+sL1BsqY1Pc9sjHLtoYI7jtnoQWs1KEo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=m7+X3qnL4TWricL7gGqVPiVOxXmsSkM9bd9hTH5z0g/4m96mrJfwjwJ1Ww5o9a/DzBv7iMbu3rxAzzG49wIeoUouMfmudIXMKEoWDS+zwtOjExITEAWzUM87j0VIDOMCFpLjOxoj4+VinBjSAK46iejCnqS7X1slBfsY9wsr6K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JCZEe//n; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JCZEe//n"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso1774441b3a.1
        for <linux-coco@lists.linux.dev>; Mon, 18 May 2026 17:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779151505; x=1779756305; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ggd5csVykghtggMe8pbnnA/QKuDIv0Rv4A5DdUcY2V0=;
        b=JCZEe//ncj3scs3zLoPVVBNgy95m5xarAuwG8lggYJ+axH0mJgQl5hZ8YPbyQlHjPe
         Mk3DJGgwM+rJ2nER7QeZ/P6k4DZR5KhEcKrY8RBh2RT/Yx0qqsn1/XzHpcse9CSdM0Ki
         GnmyeEnBVICGb3SqPutCopef6ex3F83dhAv/aodeHgHPIKJXanDSIn40KhK7oXQIr1hd
         xlOf2f7koMGm6fxbyRXosAeolqaTHSIkF2ssnk9GAVwDALcMCTeg2hr1ik4rwrTr0TR2
         +O4fsvhYoz4shSQcZf4D/PlVxCYiuiyYBhFbCA4ov9omRc4leoIfEi7PJWmgo7Pa6BMn
         EsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151505; x=1779756305;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ggd5csVykghtggMe8pbnnA/QKuDIv0Rv4A5DdUcY2V0=;
        b=A1lY424bvxy1fEAPvUTEbLw4UTvJ6lqW3P8YgbXgvoJZvb2lLOpQoGfZi1L8xRYY06
         hnLGDBDIaSnYCjU6rzWyYFKzqJB+kknedWJqKs3hfhshVqLt6NzAV5stnFyXVCYpc1Y4
         GRJ2iOgCSO88Bmx961RNGv9KSUxWjYVljwpI4gx/SekHfuG3/OKbTDaRO/HTtFoSLNRG
         5mzwZIqNyAxPf47BUW11fZXtngAhtzaHJzFWGJ4BUuv3hdzNK55QFU1QkmmSy3rqY65x
         JR4Mn5Ev/M5CSwDEkv0JXTVWDMhiQOwM7ojBKTytoTzO7EeRoFpolVZLfVc8erOk/lxY
         MvKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OHeX/ePUxdNVVvGcmNahBa6u5MWl9unPzSBYohf5d41SGMNSXoJXjfr9rNEi08HFRnD8MtVACxHks@lists.linux.dev
X-Gm-Message-State: AOJu0YwNi3EOzfPJPP+onSE506Xpsyj2oYEakgLv8OsPYmdj9S/F17gu
	aGy5ge23sduWdogGQfBeAJrdNFdRCvuQVx/W1NSUjfC34tRbgKnx25X/Bc+lcBiE+QM1hGTC6iG
	hjHJ2JQ==
X-Received: from pfmm23.prod.google.com ([2002:a05:6a00:2497:b0:82f:6a88:310b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1ca4:b0:82a:5ef0:210b
 with SMTP id d2e1a72fcca58-83f33c255c5mr15421546b3a.15.1779151504718; Mon, 18
 May 2026 17:45:04 -0700 (PDT)
Date: Mon, 18 May 2026 17:41:11 -0700
In-Reply-To: <20260410232654.3864196-1-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260410232654.3864196-1-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <177915046516.2224783.65133220965322974.b4-ty@google.com>
Subject: Re: [PATCH v2] KVM: TDX: Fix x2APIC MSR handling in tdx_has_emulated_msr()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kas@kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	binbin.wu@linux.intel.com, dmaluka@chromium.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="utf-8"

On Fri, 10 Apr 2026 16:26:54 -0700, Rick Edgecombe wrote:
> Rework tdx_has_emulated_msr() to explicitly enumerate the x2APIC MSRs
> that KVM can emulate, instead of trying to enumerate the MSRs that KVM
> cannot emulate. Drop the inner switch and list the emulatable x2APIC
> registers directly in the outer switch's "return true" block.
> 
> The old code had multiple bugs in the x2APIC range handling.
> X2APIC_MSR(APIC_ISR + APIC_ISR_NR) was incorrect because APIC_ISR_NR is
> 0x8, not 0x80, so the X2APIC_MSR() shift lost the lower bits, collapsing
> each range to a single MSR. IA32_X2APIC_SELF_IPI was also missing from
> the non-emulatable list.
> 
> [...]

Applied to kvm-x86 vmx, with a massaged comment as suggested by Binbin.  Thanks!

[1/1] KVM: TDX: Fix x2APIC MSR handling in tdx_has_emulated_msr()
      https://github.com/kvm-x86/linux/commit/1f3e69af5f93

--
https://github.com/kvm-x86/linux/tree/next
