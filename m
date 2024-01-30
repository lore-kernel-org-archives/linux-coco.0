Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD15086AE6
	for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 16:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706631647; cv=none; b=Gx7ykzJTb3xsx+Fo6yHdLQqsyepm1pFp9q/cxTAemigjX5RQrANfKPS5U/fpXk6hX/DCkMlWo8UIfVT2haVoEF1khtl3zz8IweEF+FdhB/y4iRzaDliN6nYmhlqMch64H0fQRP0/CethT0HMG0FwjaxzRoGQ6SQRz+32MyUhMug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706631647; c=relaxed/simple;
	bh=9dqoKUzfPnS0ouqZmUsutY8WSQ36Ew7hhDXp38tOQgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RG2xbvybelyM1vOKiLoZUQsNWl2DHtGgBh0OgS0bAbIo4pd93I9QnKGG6ScyD1ioJS97Q4RPsTp3zfQ5Cq/AJ5ih+U4omsqLGDQphNG4DyiQA7+OzWjjyjr64sA3jRucv33vUKCfBEVQMSUAwTbr/ytaCl6TpBwFwBY4kiTCwwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=RFQwU6NC; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="RFQwU6NC"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 161F040E01B3;
	Tue, 30 Jan 2024 16:20:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7yVcVDOXyjWb; Tue, 30 Jan 2024 16:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1706631639; bh=alWf9PlcGUIY347NLIw+uw/YZFl5yuvijufcFHJXHac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFQwU6NCK40raUA31PWhXPZKfjdfhCWWZXv8repbMJaj2d3tzBIwSyhuY0zVFuL/t
	 nGJHjh6F7ujehycrE+kCrMDQZbCn6ouDqp23GJ73Fe4jnIX5WaGDIQQFF/qUtf/Ujt
	 /nknHKZZogm7FogSq7ryuDZobR5h0c7ThyoD7NY9hhxHGvpjhDbEKpk8pPCyPPguQL
	 dIdj3AzixiVWYkSS78kQTyZ0yFwnUF5RCxkLDV8R8X88vHhSXKgLLF1ksUq8pnIGKv
	 2fLvgnufs9u8Ml0SxAJughMKYrDg13dD+ul8HQPKYgJvWhL7j+BAW0DSrfUwG1XVY7
	 /By15uTzDxBIdER5lNvw1JI0VM9rMiPJeT7rt2TWOOD7K8H3ZScAj+wzJTCs1wVW5j
	 LvnDz5D4NIMP7QMiItg4PTaMZZLKAjVSpDES8TEw/8h7+7k3xyGQCQPYYcSeAYYh79
	 VbAFiHvz0xEHOt1rmkwfNS/TqeT0R1fjx7XRHgoL6l4SbRbWj0DJY6kr1iuelg/9Xn
	 /nCrkyaNKsNK3+BXCCFQWjRCcVWbPEV6YUZxfgY9IXU3hb9lZY6rBroNNLIcA9CXq5
	 Sotj8mLiXilxw9pP/mTw6O34JotnPspFg0YTCAVMGQ147AKOYj5YSRCf95TC47qAFT
	 tFPrc8bdrPIOARXme6y93Rgc=
Received: from zn.tnic (pd953033e.dip0.t-ipconnect.de [217.83.3.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B083840E00C5;
	Tue, 30 Jan 2024 16:20:00 +0000 (UTC)
Date: Tue, 30 Jan 2024 17:19:55 +0100
From: Borislav Petkov <bp@alien8.de>
To: Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: x86@kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev,
	linux-mm@kvack.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com,
	ardb@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org,
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com,
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com,
	rientjes@google.com, tobin@ibm.com, vbabka@suse.cz,
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com,
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com,
	pankaj.gupta@amd.com, liam.merwick@oracle.com
Subject: Re: [PATCH v2 00/25] Add AMD Secure Nested Paging (SEV-SNP)
 Initialization Support
Message-ID: <20240130161955.GFZbkhq2RDUrW5-NvV@fat_crate.local>
References: <20240126041126.1927228-1-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240126041126.1927228-1-michael.roth@amd.com>

On Thu, Jan 25, 2024 at 10:11:00PM -0600, Michael Roth wrote:
> This patchset is also available at:
> 
>   https://github.com/amdese/linux/commits/snp-host-init-v2
> 
> and is based on top of linux-next tag next-20240125

Ok, I've queued this now after some testing.

As of now

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=x86/sev

is frozen and fixes should come ontop so that Paolo/Sean can use that
branch to base the remaining SNP host stuff ontop.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
