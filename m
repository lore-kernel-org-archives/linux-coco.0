Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF6D65E
	for <linux-coco@lists.linux.dev>; Fri, 17 Nov 2023 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMsxu5bc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700225277; x=1731761277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vrg5gUZ/jMGqMBt8YEN5qhHkBV7QEHhcKHWcin9Xb64=;
  b=aMsxu5bcglDwSd7IlYy1RgNo6zpPkPaqptI5uBgBpbxCnZV6WCl7hYfM
   jnwFe8QN4Yty2xjxVZADEOhb0mADf4w5SItP2zBwm5HVNOeRhhP6GwDet
   rWZSD4ly9E6cgv5JQ24OHNViV9JgAm63OFHMKbwbCDiwrFnfO9TeK0+8w
   //2njq9hwiPIy0JyHXwiMmIVQ9s/UI/iT31cawlIfPs3dJq+Inh5k+A6Q
   vsVYv9ImGb8HFUR3IpqyKzRrf+w/QKYpzTFei/e0qniU4AjZFeZPJUqYn
   NC5WD7LQjx+U0mEebi/jyLdHCV2yR8csGmeIiGlBjeSbfibjrQqs7j++0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="422388079"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="422388079"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:47:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="794827071"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="794827071"
Received: from fsforza-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.44.215])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:47:51 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 8D3D310A32D; Fri, 17 Nov 2023 15:47:48 +0300 (+03)
Date: Fri, 17 Nov 2023 15:47:48 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
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
	"Huang, Kai" <kai.huang@intel.com>, kexec@lists.infradead.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv3 00/14] x86/tdx: Add kexec support
Message-ID: <20231117124748.umfuc3no2qvh4shj@box.shutemov.name>
References: <20231115120044.8034-1-kirill.shutemov@linux.intel.com>
 <ZVYGx1EwzjXbTEyX@MiWiFi-R3L-srv>
 <20231116125612.daxettqcapled7ac@box.shutemov.name>
 <ZVYkdI74X8acDtTq@MiWiFi-R3L-srv>
 <ZVYrA+Ks0DGFo/0p@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVYrA+Ks0DGFo/0p@MiWiFi-R3L-srv>

On Thu, Nov 16, 2023 at 10:45:23PM +0800, Baoquan He wrote:
> On 11/16/23 at 10:17pm, Baoquan He wrote:
> > On 11/16/23 at 03:56pm, Kirill A. Shutemov wrote:
> > > On Thu, Nov 16, 2023 at 08:10:47PM +0800, Baoquan He wrote:
> > > > On 11/15/23 at 03:00pm, Kirill A. Shutemov wrote:
> > > > > The patchset adds bits and pieces to get kexec (and crashkernel) work on
> > > > > TDX guest.
> > > > 
> > > > I finally got a machine of intel-eaglestream-spr as host and built a
> > > > tdx guest to give it a shot, the kexec reboot is working very well,
> > > > while kdump kernel always failed to boot up. I only built kernel and
> > > > installed it on tdx guest.
> > > > ------------------------------------------
> > > > [    1.422500] Run /init as init process
> > > > [    1.423073] Failed to execute /init (error -2)
> > > > [    1.423759] Run /sbin/init as init process
> > > > [    1.424370] Run /etc/init as init process
> > > > [    1.424969] Run /bin/init as init process
> > > > [    1.425588] Run /bin/sh as init process
> > > > [    1.426150] Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/admin-guide/init.rst for guidance.
> > > > [    1.428122] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.7.0-rc1-00014-gbdba31ba3cec #3
> > > > [    1.429232] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS unknown 2/2/2022
> > > > [    1.430328] Call Trace:
> > > > [    1.430717]  <TASK>
> > > > [    1.431041]  dump_stack_lvl+0x33/0x50
> > > > [    1.431581]  panic+0x324/0x340
> > > > [    1.432037]  ? __pfx_kernel_init+0x10/0x10
> > > > [    1.432629]  kernel_init+0x174/0x1c0
> > > > [    1.433149]  ret_from_fork+0x2d/0x50
> > > > [    1.433690]  ? __pfx_kernel_init+0x10/0x10
> > > > [    1.434277]  ret_from_fork_asm+0x1b/0x30
> > > > [    1.434850]  </TASK>
> > > > [    1.435345] Kernel Offset: disabled
> > > > [    1.439216] Rebooting in 10 seconds..
> > > > qemu-kvm: cpus are not resettable, terminating
> > > 
> > > Could you shared your kernel config and details about your setup (qemu
> > > command, kernel command line, ...)?
> > 
> > We followed tdx-tools README to setup the environment and built host and
> > guest kernel, qemu command is as below. I copied the
> > tdx-tools/build/rhel-9/intel-mvp-tdx-kernel/tdx-base.config to the
> > latest upstream linxu kernel then execute 'make olddefconfig'. Because
> > your patchset can't be applied to the stable kernel with the 731
> > patches.
> > 
> > cd /home/root/tdx-tools
> > ./start-qemu.sh -i /home/root/guest_tdx.qcow2 -b grub
> 
> This is the qemu command when execute above line of command, just for
> your reference if you happen to not take this way.

Still failed to reproduce :/

Blind shot: could you check if the patch below makes any difference.

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 20e946c9a39d..8bb231e8ef9d 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -875,6 +875,8 @@ static void tdx_kexec_unshare_mem(bool crash)
 	/* Stop new private<->shared conversions */
 	conversion_allowed = false;

+	if (crash)
+		return;
 	/*
 	 * Crash kernel reaches here with interrupts disabled: can't wait for
 	 * conversions to finish.
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
