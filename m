Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF57030F95A
	for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769619697; cv=none; b=eJjdkSgRYCC94tDwECFbD4ukcCeKHQ9H0pNc5wYGntpCedeFXj0md2T/cayPp+dEy+2uhuKrSVi3HVl1cDk8aOJzj2jiPPB42JTTxgQaLBt7OA+0v8kfsiHtJNyUpjrpbX/46VOWE6jjj9i2MBx1JY5/oHbHlIDzmr8Qy2TDxgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769619697; c=relaxed/simple;
	bh=E4aE/jIRFc4eB6I5uW4nuh859BTJOyKFF5LtkidkaOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ux4RLuP4aHYDZx12OmQAYTPhko1WqBXbG9dkELlgCxQ+o3fBALf8WYo2T45vZ1emNAuDUsaF7Was+0TfbpvV+zH9n6hKbe+U9HW+IwrcdmdYN6X/FM4tfcSkCv1B1rTS6t7Zv8K15mPKHe2wxmAcJcniIt2EEKsR0cpFerHfuIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=QoMZ+5rv; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="QoMZ+5rv"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 83C5E40E02F7;
	Wed, 28 Jan 2026 17:01:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0ggN4jBK1EqE; Wed, 28 Jan 2026 17:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1769619686; bh=LiUa1C3RSG3kqG40f+J/oCp9wTWGDH0Q7Q+8BwMfzyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QoMZ+5rvA/nLtMb9/9bAef6uvg8xCWhzvCAG6Gj+aJKZrrh5SQwVXxRgD569XYD6c
	 FHzfJ/oWKn2d4YG/E1KbufmMoSXUapSaBLoz8oLFJdZ33qBlDROKdtkQCx4KwukIhy
	 /YBex93qNDHdGRRbuY82dK57Ap3Gm0i2AWwbFg/Ur8UpUY58rb8PLP9tdritmxrjzC
	 KUNWRhWiqsRwkBjn2I68cBQYKG7V5s+65p6WMAvNls0IQ0s3jhE/Yn8CAdzCMGwM4p
	 eT5Mn4c/gWLg4i7wUS9dDXKt5Cv2t8BIVFd6eDWieZ/WGDY+woFwD1+6zNOiA1l1c1
	 QvMEinvwPaAAkv60RW9hOvTOkTdQ8+HX1dQ475hqgsrhj/ujm75jQMMNzqIbDzsXOn
	 ZtmT8lrS99z4aAnQrIBIRa6Q1yATJ2DAq4qOPiuNIXYWyf14yz5WHFdQJWazUNNuFT
	 XNtN2U0O7EzzA8Keh9AoXXEqeYpV6Q4LWsW9J+fGNOiagkvTtEfL8uvT2wOLvcbxgV
	 dXc+oni8wiXCAb2BLcFRZPrTf01ALXZs4ZH0TN91a/Anns75lXIQHMpwdAfxeybBpH
	 wzuW9jX9XMjLSA0VTeof7xYbf7rHfMgjN0mODRSt6eGpz7qkyof2Yd1KGv2Hxmlsmk
	 ChTmM3l9YzfYQjwkPgNiLLs8=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id B5A7C40E02E5;
	Wed, 28 Jan 2026 17:01:10 +0000 (UTC)
Date: Wed, 28 Jan 2026 18:01:04 +0100
From: Borislav Petkov <bp@alien8.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Uros Bizjak <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	x86@kernel.org
Subject: Re: [PATCH v1 01/14] x86/realmode: remove I/O port paravirtualization
Message-ID: <20260128170104.GPaXpA0LK8C3KQN9wj@fat_crate.local>
References: <20260119192923.651588-1-hpa@zytor.com>
 <20260120195407.1163051-1-hpa@zytor.com>
 <20260120195407.1163051-2-hpa@zytor.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120195407.1163051-2-hpa@zytor.com>

On Tue, Jan 20, 2026 at 11:53:53AM -0800, H. Peter Anvin wrote:
> In commit:
> 
> eb4ea1ae8f45 x86/boot: Port I/O: Allow to hook up alternative helpers

We do this format for referencing commits:

  eb4ea1ae8f45 ("x86/boot: Port I/O: Allow to hook up alternative helpers")

> ... paravirtualization hooks were added to (some!) of the port I/O
> functions. However, they were only ever used in the 32/64-bit
> "compressed" directory, and never made any sense in the real-mode
> code, which is notoriously size sensitive.
> 
> Without these hooks, <asm/shared/io.h> is usable directly, so mode

s/mode/move/

Otherwise, LGTM.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
