Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FBC3ED3AA
	for <linux-coco@lists.linux.dev>; Thu, 28 May 2026 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779973743; cv=none; b=MlnnI3aJJ9J43Pq20HcA5qx53DWc/7nheILxayKu+IFIYor6L0aNCHKrXScX2XDdy57zOHURulU7eOPgWqxYCBRl1DKN7XgEylYJLPLFFZuLPmQVULv+iDExlabif4VYLbHQFgJLCIHPmEvE5FksKIBVzEaOb5/HaxQ9IRbq/DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779973743; c=relaxed/simple;
	bh=oBmK9WOIKlWbMEaKPBbTmm7YEGcIoyZ57guz/RjSxNU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kcPP4sqQ81HYIm02v8o9Yiz/gztHUMsYZCCAp/duHOkzkph97wDmv/HSFAK6e7EM++lfc2iiQM/EnscAlpyYUjCKPBf/XAnAPsrGE5aH67Bwff+rjYvg/83cCTLDY1597u9Q2k/FoOJSltSJgruObChuEU6lF9zYpuXGLBBLLG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XnHN4FU8; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XnHN4FU8"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c827c880e39so6544832a12.0
        for <linux-coco@lists.linux.dev>; Thu, 28 May 2026 06:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779973741; x=1780578541; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oBmK9WOIKlWbMEaKPBbTmm7YEGcIoyZ57guz/RjSxNU=;
        b=XnHN4FU81wVjX7Xw/V4Dr58Sdu5TTMTB/GxddmJVFIIf1GexW1GVjp+Z9/03JwIKj9
         zsxbYmnuHqRU5NXigX7qzkpkHdtiTUC1RMO+pqvMKGx7ShPs8vxM7p4f35IgV4SinMSQ
         mCjBQmebP/ZEt3rdyUK0Dyv/KjTVLPux7RPr5LVuVGy10JQSs8szyC3XuF9ITbPsEMyB
         95v8G/aCU7GcgPuWAHgQbPNS57D2t5gWpo7HiJLPUQyHoRstFsczjcnfkS7ACs2a37V6
         KfbpzbDvU3BDYK+CCfZZvNhjdHKquhDmhsnSJbNnpGR3K7S3Ahk1kRldrw+9C31DvW8X
         83sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779973741; x=1780578541;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oBmK9WOIKlWbMEaKPBbTmm7YEGcIoyZ57guz/RjSxNU=;
        b=OBD9FFG32n2w42Xj9aNscBsv2mRXkcqG5z0JqpparApPBpaDRjQFoOQgMACHo8TImU
         zcbDLjbbBSPEIUPwzM5S0PSEM4O3FQdsSBz6z1z/duqQ5NG0QBvEEO1aIY1s6dJIHbXO
         2vxPNxjFGlBSsLAKbN8hjY2vBXje+t+ICzkSYGzGDNh9D7gv1OasM7JJegGxr36C2Uic
         wEvoBwJjED4zZ64uwk5NdIqpkCQPqi4dTujEcYk6Uant77Nw7bFunqoLFPCOptclTaij
         TqNMavzuZnHC7fQL0UcRdTUNWQDbCT7z8ljPSrCx3vIyR4IjNb/Xe0Q3owXfrEwSMeOa
         cUrw==
X-Forwarded-Encrypted: i=1; AFNElJ9cI0Mzn9eNmviaTcA+F1sC0kAyMMOV8K9HvsOlzuo3RVVllEjfKDELBVroTINTaPfVMn8c5CxMpAaN@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5y5OnUbCFFf3L34P6XLvzFcBXFkd7uzs8IGuPyaFVU6+EUqmo
	lNVoahc1E3kzH0IE9fJyOEz+VaoXu7ZnikZ1BT9MGa1QHySw2wwbFU7IdoVvSbWplVNehoOVEOR
	F/NWg8w==
X-Received: from pgkn21.prod.google.com ([2002:a63:ee55:0:b0:c85:a9c:435f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6490:b0:39b:87f0:758e
 with SMTP id adf61e73a8af0-3b328c6ad42mr29658480637.8.1779973741256; Thu, 28
 May 2026 06:09:01 -0700 (PDT)
Date: Thu, 28 May 2026 06:09:00 -0700
In-Reply-To: <a8f495f0-b4a9-42b6-be74-4fa9d83c7346@suse.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260528113605.267111-1-jgross@suse.com> <a8f495f0-b4a9-42b6-be74-4fa9d83c7346@suse.com>
Message-ID: <ahg-bEiwyqYTdWOD@google.com>
Subject: Re: [PATCH v2 0/6] KVM/x86: Drop "1" as MSR emulation return value
From: Sean Christopherson <seanjc@google.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Woodhouse <dwmw2@infradead.org>, 
	Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, May 28, 2026, Juergen Gross wrote:
> Please disregard this series, there is one complication sashiko made me
> aware of.

Sashiko beat me to the punch. :-)

See commit 2368048bf5c2 ("KVM: x86: Signal #GP, not -EPERM, on bad WRMSR(MCi_CTL/STATUS)")
for a real world example of how things can and will go wrong.
