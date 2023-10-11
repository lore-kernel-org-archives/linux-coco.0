Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711081F19E
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EtPW3gLp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tqca0/uv"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1697029785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ukHBjWe9BEjJdhdsHoBpWRY0IShWSvasiVUT5USEBB0=;
	b=EtPW3gLphi22K401ncNlj+K3wTaYGCDyMJUwYDsNAx8NAPEnKsEOIVG6JGN7LJPnBiAuxY
	erUbjx0uUQHQojZ5YULHBxypqmKxS44DksQWMVkxKLJyyx6440qdwAWicJ+ivMpiCetY8P
	S4U1NwQbAwTKA5pXnNu6hNzi0LYi5khxIskM0vn0ra7QIEPP2OKp0eUwQGrkih912a3MTJ
	q/zs7qmN+klRS9wzeKPVXU+UZPBjGgVKYdBkjFcRT488BTOn83bjD4/XNXV0r2ST/M7+i0
	dN7hIKDcL1b7Jk6Nqhh62Fn78/E262XYAu8IxOAj/ARAm+r3mkPupMtXiiJPfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1697029785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ukHBjWe9BEjJdhdsHoBpWRY0IShWSvasiVUT5USEBB0=;
	b=tqca0/uvwz2DGA34PwCnpcObQzD0u+u480E5bj3LsbusevevC0OfpZdCdHvaSoLZTaEbPX
	gt8XUM5WwX0AHADQ==
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Tom
 Lendacky <thomas.lendacky@amd.com>, kexec@lists.infradead.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH 03/13] cpu/hotplug, x86/acpi: Disable CPU hotplug for
 ACPI MADT wakeup
In-Reply-To: <20231005131402.14611-4-kirill.shutemov@linux.intel.com>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
 <20231005131402.14611-4-kirill.shutemov@linux.intel.com>
Date: Wed, 11 Oct 2023 15:09:45 +0200
Message-ID: <87fs2hl2zq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Oct 05 2023 at 16:13, Kirill A. Shutemov wrote:
>  
> +	/* Disable CPU onlining/offlining */

That's not what the function does.

> +	cpu_hotplug_not_supported();

Thanks,

        tglx
