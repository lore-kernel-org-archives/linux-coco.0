Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F51C135419
	for <linux-coco@lists.linux.dev>; Tue,  2 Apr 2024 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712072552; cv=none; b=jILYSowRZUnzw6RTrB/nu8CKIKcO7xRz19bwlH5JcB2LAQeTO879vPIhrN0gWrF219w1iq2IfyT8I4EQkCwX0G49ibGBKrJ3NQ07kKmy6I7qcrxQ1Y++imY0KQHidWbclUy2g0giqXS6WrYdwyzxmlKbN3m0OxQ8uA4d9itygx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712072552; c=relaxed/simple;
	bh=RZamI5f8/aC7oIQVbalM1Cimf9G3hUXqlyz/JLjpQQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAWPGo4JH/VqDs/YlR3SkgEcBt72Pbq+0J/KlOhgQ2ODvEWK8sOodjQ2Ey1+XmTO61LJMJt3CmFhZ3FNJkjAms9QqDYP+PfOcXiv1MieEH+AF2aFlPMuIQWck9nPAZIGAEvqn9PL6EmTy5b6uhcQYxCiMg1bNv/h/NsCmByPcW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+i5w65f; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+i5w65f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712072551; x=1743608551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RZamI5f8/aC7oIQVbalM1Cimf9G3hUXqlyz/JLjpQQQ=;
  b=S+i5w65fjUEripRShca8q3p+psluGpIJn+bcqkLuaopIjm+XVNbHFhKs
   nFUQd+CVg9eg91MZh+p68hQ2siIjy9nV1dhMvvFeBbuv1MOMuxazUEFDu
   cYTLYawrM+OUDZeK9Kf1cXmVFVucFA9tLrdwrL1Bf12vAk664ldpUWKBI
   NVqL0PamVWLF9gQgO/T3/y0MwiI4amsD8w9eMAb5Yr8T1bSmNTah7WjFk
   C/rbbwbaHM+vu+x6WaYcsvpkTMrR6l+mdlGSPaO21cqiE1f7XRLTNgFH/
   PZg6FO/rdqRvFr7Ozfp5qzeQtnh40MykDEcfgY/FopAC0QUvZDaAF2e8m
   w==;
X-CSE-ConnectionGUID: 1ob5y0BhRnq7xnK1NJvR7Q==
X-CSE-MsgGUID: W5YD/x2LSBmUpmtaMYEQRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="17870106"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="17870106"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:42:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="937083654"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="937083654"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 02 Apr 2024 08:42:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id A10101C5; Tue,  2 Apr 2024 18:42:23 +0300 (EEST)
Date: Tue, 2 Apr 2024 18:42:23 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Elena Reshetova <elena.reshetova@intel.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish" <ashish.kalra@amd.com>, 
	Sean Christopherson <seanjc@google.com>, "Huang, Kai" <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>, 
	kexec@lists.infradead.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv9 05/17] x86/kexec: Keep CR4.MCE set during kexec for TDX
 guest
Message-ID: <j4s4n5slt6a234w5o5r4zjmb3xj53odnmwekt6ihotfzotd7ur@ghyvphwcki57>
References: <20240325103911.2651793-1-kirill.shutemov@linux.intel.com>
 <20240325103911.2651793-6-kirill.shutemov@linux.intel.com>
 <b94c81ef-50f2-4e66-9533-461791777d10@intel.com>
 <dlixf7bld4efdh5goir5nreabkgtcwfbvv2rovjqrvjttplqss@auuqnt4h2llj>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dlixf7bld4efdh5goir5nreabkgtcwfbvv2rovjqrvjttplqss@auuqnt4h2llj>

On Fri, Mar 29, 2024 at 06:48:21PM +0200, Kirill A. Shutemov wrote:
> On Fri, Mar 29, 2024 at 11:21:32PM +0800, Xiaoyao Li wrote:
> > On 3/25/2024 6:38 PM, Kirill A. Shutemov wrote:
> > > TDX guests are not allowed to clear CR4.MCE. Attempt to clear it leads
> > > to #VE.
> > 
> > Will we consider making it more safe and compatible for future to guard
> > against X86_FEATURE_MCE as well?
> > 
> > If in the future, MCE becomes configurable for TD guest, then CR4.MCE might
> > not be fixed1.
> 
> Good point.
> 
> I guess we can leave it clear if it was clear. This should be easy
> enough. But we might want to clear even if was set if clearing is allowed.
> 
> It would require some kind of indication that clearing MCE is fine. We
> don't have such indication yet. Not sure we can reasonably future-proof
> the code at this point.
> 
> But let me think more.

I think I will go with the variant below.

diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
index 56cab1bb25f5..8e2037d78a1f 100644
--- a/arch/x86/kernel/relocate_kernel_64.S
+++ b/arch/x86/kernel/relocate_kernel_64.S
@@ -5,6 +5,8 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/stringify.h>
+#include <asm/alternative.h>
 #include <asm/page_types.h>
 #include <asm/kexec.h>
 #include <asm/processor-flags.h>
@@ -145,11 +147,17 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
 	 * Set cr4 to a known state:
 	 *  - physical address extension enabled
 	 *  - 5-level paging, if it was enabled before
+	 *  - Machine check exception on TDX guest, if it was enabled before.
+	 *    Clearing MCE might not allowed in TDX guests, depending on setup.
 	 */
 	movl	$X86_CR4_PAE, %eax
 	testq	$X86_CR4_LA57, %r13
 	jz	1f
 	orl	$X86_CR4_LA57, %eax
+1:
+	testq	$X86_CR4_MCE, %r13
+	jz	1f
+	ALTERNATIVE "", __stringify(orl $X86_CR4_MCE, %eax), X86_FEATURE_TDX_GUEST
 1:
 	movq	%rax, %cr4
 
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
