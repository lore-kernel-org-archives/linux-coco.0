Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85663429803
	for <linux-coco@lists.linux.dev>; Wed,  5 Aug 2026 22:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785970181; cv=none; b=VbSo28KxJwEZ6S7lqQB6Fmk7zZlfSGRknZvZhDxFDuCK+w9nsKFQHdkjsL17lp9Z1TNY5D6y6r73nGPhhva+d8Nnp60I3MzbkPUvtAF5PpE9c6KfrtP4S09I7OZVJK0FXXrWOy2fNAQ+ibp+CbhE8cvy4bNVOFDPKjhwt6JOxDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785970181; c=relaxed/simple;
	bh=jfOV2obLipkD+y3jvt4DBvBwYkaZOEFMfwoNYs3XlQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0xDymbhIC8r2FO2nvJjMCwn07Xvk5lwjfYbfjwckCr8LCMkF3lxAUzTBM2YdOAA/Sh1mQ5EEVVtBepSogmKw2lP+Fkz1dcwZknbIor1gNLm1+zQe6k2/5X0tbssgWQ5HYXzJH5gcWfkYSyUcbOpi9qcD4ZjJWDaXMzAKAKdPpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=WW3mUzgw; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="WW3mUzgw"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 24B6E40E00C3;
	Wed,  5 Aug 2026 22:49:36 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id XevHoCsztfrX; Wed,  5 Aug 2026 22:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785970166; bh=11a3rOlS1cYOCSqhdbwbQhgoopQLgWS4fQ0LjBkvf34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WW3mUzgwjw846piHFFCgM5ltUSssCsDK7wmazWbRmFiLyqM4OY4TfWWS+6+KNZ8iM
	 vt4AThrjXaNorLh6b+b3mE6CUy/Fv2HzLbwosxw8XdlEixwjDATNhKhx0CIwZ+mhVP
	 ncC/gp1oUwT5CAX4kdORns6B7NQqnKz9bhBEy3nHZulB57TlaLC9/SGe9Hl1WivVlg
	 5pWE317oGyK74uM8KJjE+Fj/jIgCbb3q4NvMiH6goYE08ymwg6VjP9zVSKvvvPhvXo
	 BMtcFGPEIX+ceJR1hLHELKhtzpE4pkpkFksxW8mru5X8AgxR0umsAEB7SVG3W17f9e
	 C9L2MVzJ0k4Pp0VtyufITUgITfYPb+BCxxP6kdRVoXV4i1Ao64dw2/V0wVYoXck9Zk
	 lmROqgPdWvZS7MehL5UFRQywvCrSXGJT+lXwNSfERY8lmphY2jZEPSwNphRAUKnT8m
	 wanax6wrJAiafHdaKiqqinYGPpUmYxlV2u5h8PixPktE5dvZK5/A6b8OSgI1fZcH1h
	 maTjbSDcYJuf797etD7KuURMzIuFgUYi+k/uNna2+FLDlxbmfW1AVKfTCBRODbDG5C
	 tkcKFthdkIssHFmkuhbCJNfz+KAz5NNFE75DX+MLAulhw/PZAy8egDZZeu2xT/SVE9
	 N4tMWPs2t7SQt5UKKUnG1s5g=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 862CD40E0031;
	Wed,  5 Aug 2026 22:49:10 +0000 (UTC)
Date: Wed, 5 Aug 2026 15:49:07 -0700
From: Borislav Petkov <bp@alien8.de>
To: Kim Phillips <kim.phillips@amd.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, x86@kernel.org,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	Naveen Rao <naveen.rao@amd.com>,
	David Kaplan <david.kaplan@amd.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v4 01/10] x86/bugs: Only log missing retpoline when it's
 actually the missing mitigation
Message-ID: <20260805224907.GDanO942iYDbai1kFx@fat_crate.local>
References: <20260804235611.4053375-1-kim.phillips@amd.com>
 <20260804235611.4053375-2-kim.phillips@amd.com>
 <20260805004441.GAanKHecgJwfAOzZzp@fat_crate.local>
 <65d82937-113d-405b-9399-b70973e84c50@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <65d82937-113d-405b-9399-b70973e84c50@amd.com>

On Wed, Aug 05, 2026 at 09:51:11AM -0500, Kim Phillips wrote:
> So it's saying there are no additional conditions than
> !IS_ENABLED(CONFIG_MITIGATION_RETPOLINE), when there should be
> (which this patch adds).

Then say that pls.

> This patch corrects code that already cares about RETPOLINE=n kernels, but
> it's also useful if you know all the target systems for a RETPOLINE=n config have
> alternatives to RETPOLINE, such as {,e,Auto}IBRS.  This will become more and more
> true as time goes by.

Why would more and more configs become relevant which disable
CONFIG_MITIGATION_RETPOLINE?

What is the compelling use case which warrants to have this in the upstream
kernel?

Give me a concrete example pls.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
