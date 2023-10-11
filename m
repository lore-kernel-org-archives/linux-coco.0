Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847A41EA92
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HRCnUMdu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hIKtc13I"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1697029691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KcBTZkFrKCC9+uriZsI68GWlw6IK9Tb1wdFpYBJJCYg=;
	b=HRCnUMdudkR0auWBbsD9vd5nJL5XsHWCK+TpeuH+ljrS+yAuh7yWwHQXVWHQtoSQ/Dg4hQ
	DWGlyJST7xM6ZlxJvio94UFxahqzw9eDXFuuGQq1XR0dnBTm+3zQOmKYF89WFsvw7OniM+
	kJp5ZeSLgo4PWDDYMgaAreJD+C8wEdJ1Sdi1UvN8LRwpbS8q03enfWDgv4KxdGWX1c1q9w
	OywHOoNEYPAT6HUmGSPqAF/N2SfS5SLoIAWjZ4iyMqCdLVLAbKC+XUXnpOuo+Ra6awNvx3
	lVy5ry0vgpgz08y4o/l0CpqmQGfVKto/KhbPKqAYnfxzhXtz+Nzvu1rstgmm7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1697029691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KcBTZkFrKCC9+uriZsI68GWlw6IK9Tb1wdFpYBJJCYg=;
	b=hIKtc13IGbcJcA+HEU8u0u/QMSxtdx3S9gGt4y4EK3K7p6Xxo3NxxcTFFuk5co9X8DfKDy
	Lvpx0r8mBCR9UbDA==
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
Subject: Re: [PATCH 02/13] kernel/cpu: Add support for declaring CPU hotplug
 not supported
In-Reply-To: <20231005131402.14611-3-kirill.shutemov@linux.intel.com>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
 <20231005131402.14611-3-kirill.shutemov@linux.intel.com>
Date: Wed, 11 Oct 2023 15:08:11 +0200
Message-ID: <87il7dl32c.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Oct 05 2023 at 16:13, Kirill A. Shutemov wrote:
> The function cpu_hotplug_not_supported() can be called to indicate that
> CPU hotplug should be disabled. It does not prevent the initial bring up
> of the CPU, but it stops subsequent offlining.

This tells me what the patch is doing, but not the why.

> This function is intended to replace CC_ATTR_HOTPLUG_DISABLED.

> --- a/include/linux/cpu.h
> +++ b/include/linux/cpu.h
> @@ -132,6 +132,7 @@ extern void cpus_read_lock(void);
>  extern void cpus_read_unlock(void);
>  extern int  cpus_read_trylock(void);
>  extern void lockdep_assert_cpus_held(void);
> +extern void cpu_hotplug_not_supported(void);

This function name sucks.

The point is as you explained to prevent offlining, but not onlining. So
can we please make this very clear? Something like:

    cpu_hotplug_disable_offlining()

> +/* Cleared if platform declares CPU hotplug not supported */
> +static bool cpu_hotplug_supported = true;

Again. This is not about disabling hotplug all together. Something like:

static bool cpu_hotplug_offline_disabled;

Which expresses clearly what this is about and does not require this
awkward negation.

Thanks,

        tglx
