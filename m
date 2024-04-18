Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F291816F29F
	for <linux-coco@lists.linux.dev>; Thu, 18 Apr 2024 16:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713456245; cv=none; b=GtsHsYu3xUZXE0TABjtHUVkWC7cRYZe6Qq1eGKaNsoAGFZb73TJTfQTQBZNLDAQgn+vzgU/GPEnatQZGrwKGygnhms1euMPxvs9iYzriziBZgMSC31xqiqQBGffjLj78SK8sN4ZI0Sqa0+KWKDY3FdKjn+31/pk+iFNWww/H9KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713456245; c=relaxed/simple;
	bh=YUdHUzQvg1qYvxqUunEZYq3yLtDxMn47wSuoCO/1wao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSJK1eXFXYW0eF+jEqyMaAlZ6J3iWxVimk5o1uyfz51AFp+TBpGlXpv/7NunxEN+yHCGZc7VM7L8peQcsCQBZxPN9RO0uYnV2yUo41p1yHbx59Hx3GCKUhNJpYZo03LnTf77U64XviueB2zjGkQ7hbtwQmF9l8rgZp+w6xrxX5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9D2BC40E0187;
	Thu, 18 Apr 2024 16:03:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ceqH68gqVVHG; Thu, 18 Apr 2024 16:03:52 +0000 (UTC)
Received: from zn.tnic (pd953020b.dip0.t-ipconnect.de [217.83.2.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E1AB140E00B2;
	Thu, 18 Apr 2024 16:03:30 +0000 (UTC)
Date: Thu, 18 Apr 2024 18:03:24 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"Kalra, Ashish" <ashish.kalra@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	"Huang, Kai" <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, Tao Liu <ltao@redhat.com>
Subject: Re: [PATCHv10 01/18] x86/acpi: Extract ACPI MADT wakeup code into a
 separate file
Message-ID: <20240418160324.GKZiFETI8U1WeaUS7_@fat_crate.local>
References: <20240409113010.465412-1-kirill.shutemov@linux.intel.com>
 <20240409113010.465412-2-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240409113010.465412-2-kirill.shutemov@linux.intel.com>

On Tue, Apr 09, 2024 at 02:29:53PM +0300, Kirill A. Shutemov wrote:
> diff --git a/arch/x86/kernel/acpi/Makefile b/arch/x86/kernel/acpi/Makefile
> index fc17b3f136fe..8c7329c88a75 100644
> --- a/arch/x86/kernel/acpi/Makefile
> +++ b/arch/x86/kernel/acpi/Makefile
> @@ -1,11 +1,12 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -obj-$(CONFIG_ACPI)		+= boot.o
> -obj-$(CONFIG_ACPI_SLEEP)	+= sleep.o wakeup_$(BITS).o
> -obj-$(CONFIG_ACPI_APEI)		+= apei.o
> -obj-$(CONFIG_ACPI_CPPC_LIB)	+= cppc.o
> +obj-$(CONFIG_ACPI)			+= boot.o
> +obj-$(CONFIG_ACPI_SLEEP)		+= sleep.o wakeup_$(BITS).o
> +obj-$(CONFIG_ACPI_APEI)			+= apei.o
> +obj-$(CONFIG_ACPI_CPPC_LIB)		+= cppc.o
> +obj-$(CONFIG_X86_ACPI_MADT_WAKEUP)	+= madt_wakeup.o

If you drop the "_X86" from the config symbol, you won't have to
re-align them. And the other config symbols don't have to have "_X86" in
them either because this is all in arch/x86/.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
