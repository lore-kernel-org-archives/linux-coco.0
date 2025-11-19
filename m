Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DB7233721
	for <linux-coco@lists.linux.dev>; Wed, 19 Nov 2025 06:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763532708; cv=none; b=Sus9QYo9arnA//18gIy+V2WQm8jzi+1p4B8F5n+KUntxWMIGxWrFFuRFybqGbeNiJoJ7fwsxwWiVgqI+F+2cv0aJl70/oGczZIUluuHXQwvsxMc8VmF3ka/uWC81a6HR8bb7IyWSSPP9hJj6euevr8slW3D0yIZ4KMUQb0BGwl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763532708; c=relaxed/simple;
	bh=lfGYhAnMEHMFWeej/7JxwxNjGa4RiT3X4tpYLvuB74U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f13KewOV3RAAGFKcQXcM/6w7jl4ihhgRnodHtzBuV/h0mSWI7Lxr6LeHzfx51+Sj+OzIXui6tzvY2lbu4kfXFbuDlbKUxyngTD9nRB80txvz8//aNKxDJINKzj4iK3LZfbAay8UxCEdk7UAtnvAWC19sTXfETw0+bzZrArCWc0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEWzIuV5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEWzIuV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763532706; x=1795068706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lfGYhAnMEHMFWeej/7JxwxNjGa4RiT3X4tpYLvuB74U=;
  b=UEWzIuV5qbEC7aVMnLXpk36/QvkVr42Nm/4W/B354n8oicjHfSh5TAWM
   /egqLiLWQ+qYs2LBrGB7S5cl84/VSfaWQlhmCvLXE9HnRPQlPozcgi98n
   NcJ1ThdCrdfozbo969mBoePirqtv6AyK0Sfpy/tB7n5bcFG4Yto1d/h2O
   MWfrIxjNWB2mRKonnKfHe9oS3QgVWDkagMwjkP5pnAdJyJdNKJB9eUx60
   ICI+l7JDzdNHAisHRIrdUtC1qE3Jkczcaow963kDeNSKgtMLAl52e/8lm
   VmZlyIxf6uXZqiDKDd6FQNlD+Bn+r2hWg4rbdCQH/cKMbtqkTOSKaxSWd
   g==;
X-CSE-ConnectionGUID: FxwyO5eHRBia8R/NHJXYpQ==
X-CSE-MsgGUID: QT+H5YXLQ2S4GhixRwV69g==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76175554"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76175554"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 22:11:45 -0800
X-CSE-ConnectionGUID: UvEHt3taRbescpBnug5UgA==
X-CSE-MsgGUID: do5WT3c0SquA69LBXFv00w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="228298919"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.170])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 22:11:42 -0800
Date: Wed, 19 Nov 2025 08:11:38 +0200
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	"Kirill A. Shutemov" <kas@kernel.org>, kvm@vger.kernel.org,
	x86@kernel.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Jon Kohler <jon@nutanix.com>
Subject: Re: [PATCH v2 2/4] KVM: VMX: Handle #MCs on VM-Enter/TD-Enter
 outside of the fastpath
Message-ID: <aR1fmtagimoLw_5U@tlindgre-MOBL1>
References: <20251118222328.2265758-1-seanjc@google.com>
 <20251118222328.2265758-3-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118222328.2265758-3-seanjc@google.com>

On Tue, Nov 18, 2025 at 02:23:26PM -0800, Sean Christopherson wrote:
> Handle Machine Checks (#MC) that happen on VM-Enter (VMX or TDX) outside
> of KVM's fastpath so that as much host state as possible is re-loaded
> before invoking the kernel's #MC handler.  The only requirement is that
> KVM invokes the #MC handler before enabling IRQs (and even that could
> _probably_ be related to handling #MCs before enabling preemption).
> 
> Waiting to handle #MCs until "more" host state is loaded hardens KVM
> against flaws in the #MC handler, which has historically been quite
> brittle. E.g. prior to commit 5567d11c21a1 ("x86/mce: Send #MC singal from
> task work"), the #MC code could trigger a schedule() with IRQs and
> preemption disabled.  That led to a KVM hack-a-fix in commit 1811d979c716
> ("x86/kvm: move kvm_load/put_guest_xcr0 into atomic context").
> 
> Note, vmx_handle_exit_irqoff() is common to VMX and TDX guests.

Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
