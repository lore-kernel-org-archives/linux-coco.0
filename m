Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B54274B53
	for <linux-coco@lists.linux.dev>; Tue,  8 Sep 2026 02:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788833225; cv=none; b=Sc+8qqvkx936Pp1Uz63EtI/x2Fx/htxBEm2bHEPJHE/mzG6r9EMqupeWdkZfGzXTGtDvYIwxeFDUrleh5oybrqpqytzjqpb9LD8cFYu1csKgPmk2mvBMVxxHCMcISYkTxh1Hy4hLR3C8zzy43q8rcOtGIwI8bGJVkU8W+kymO0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788833225; c=relaxed/simple;
	bh=1bDpjmehz57aQPddXQdZahHgqj5/zPnXJgjruqlsnoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJH/Q9kCTlpgmMH8JUJU0mYD90J4rwHVnixm9y6GzrZDlLN+iisTiSutGZ/owI9NLHtsZ/OhV7XProic4xpB3oiHy0SkPl+Kj4sAcHeJDwq3jiRM7NnPpCN6+/3tJq+elQLJh3IH/6b7lmplI+TGTqweBz9/+weEqDFCKWFORwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rn2bFVyK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rn2bFVyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788833223; x=1820369223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1bDpjmehz57aQPddXQdZahHgqj5/zPnXJgjruqlsnoI=;
  b=Rn2bFVyKk5cwP6964bKWUzI2prrOemYkhHpzw1NumlQW2Eo8hel2rwBr
   dqjzrNYhyJgNI4+GyWD814AMuQs/tm8FxC4pPT1eauMehlZq2RLna3Q1e
   abpkdXmNVFyora0uu4EF2ytky6C0NuCFI+rTTAN8MHL2DpLApnx7TNorN
   J6wVEPWvxFS4mWmlDc6mZPin8ashgKQB+226XQnU6dM4nuwAVGp5JO7bh
   vYBSL0e4cKmorX/xkAFwmxVGBUYYZgbiubDfLl0PmPcR9CG2h5j8GSRI5
   4TxJgwXBQMb4HScWnRk0on+VZPA4eThrqmQigYC9hFoQBcIds+jT2W0y+
   g==;
X-CSE-ConnectionGUID: MhtPCAntSDquS1D+WESrnw==
X-CSE-MsgGUID: a5u+D5T4Tle2k5I3OMnlvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89101898"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89101898"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 19:07:02 -0700
X-CSE-ConnectionGUID: up5JpFSgRWKzaBtKHgkI5g==
X-CSE-MsgGUID: C+dBTTI7SyWeLsCXQTcZNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="274994654"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by orviesa005.jf.intel.com with ESMTP; 07 Sep 2026 19:07:00 -0700
Date: Tue, 8 Sep 2026 10:06:58 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Tony Lindgren <tony.lindgren@linux.intel.com>,
	dave.hansen@linux.intel.com, x86@kernel.org,
	linux-kernel@vger.kernel.org, kas@kernel.org, nik.borisov@suse.com,
	rick.p.edgecombe@intel.com, yilun.xu@intel.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH v5] x86/virt/tdx: Formalize SEAMCALL leaf version
 encoding support
Message-ID: <ap9twgQA2avLI+ro@yilunxu-OptiPlex-7050>
References: <20260901105436.461823-1-yilun.xu@linux.intel.com>
 <ap6eDuCtcQ_GjTbI@tlindgre-MOBL1>
 <2ef38e83-dacc-4e2f-9b22-b02381664d9e@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ef38e83-dacc-4e2f-9b22-b02381664d9e@intel.com>

On Mon, Sep 07, 2026 at 07:35:31AM -0700, Dave Hansen wrote:
> On 9/7/26 04:20, Tony Lindgren wrote:
> >  /*
> > - * Used in __tdcall*() to gather the input/output registers' values of the
> > - * TDCALL instruction when requesting services from the TDX module. This is a
> > - * software only structure and not part of the TDX module/VMM ABI
> > + * Used in __tdcall*() to gather the input/output parameters of the TDCALL
> > + * instruction when requesting services from the TDX module. "version" is
> > + * encoded in RAX along with the leaf number. Others are raw input/output
> > + * registers' values. This is a software only structure and not part of the TDX
> > + * module/VMM ABI.
> >   */
> 
> It's a wee bit silly to talk about "version" in here. If you need to
> comment on "version" specifically, then put a comment *on* that variable.

Yes. I'll recover the original structure description and comment on the
"version".

And Thank Tony for the description for "version".

----8<----

 /*
- * Used in __tdcall*() to gather the input/output parameters of the TDCALL
- * instruction when requesting services from the TDX module. "version" is
- * encoded in RAX along with the leaf number. Others are raw input/output
- * registers' values. This is a software only structure and not part of the TDX
- * module/VMM ABI.
+ * Used in __tdcall*() to gather the input/output registers' values of the
+ * TDCALL instruction when requesting services from the TDX module. This is a
+ * software only structure and not part of the TDX module/VMM ABI
  */
 struct tdx_module_args {
        /* callee-clobbered */
@@ -145,7 +143,10 @@ struct tdx_module_args {
        u64 rbx;
        u64 rdi;
        u64 rsi;
-       /* leaf ABI version, encoded in rax */
+       /*
+        * leaf ABI version. Note that it gets encoded into RAX along with the
+        * leaf number.
+        */
        u8  version;
 };
