Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1499166F37
	for <linux-coco@lists.linux.dev>; Mon, 19 Aug 2024 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724069308; cv=none; b=BUY3BiVSkAXhWrbD7fF0jNOMGaQ21NhVtK+Sz1DpAgBnbMQcxpKnEsK+j30KJAKnlSzSxzTG0orSDLvsq0R9nYN0jioH21mUDfz69VOyIu+HE4zc1AG3J53Pk20JQ62WK7qa3Q4/5dophfEi8ydt2qJHH58D1c5orOmj6nuf2ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724069308; c=relaxed/simple;
	bh=RWyAIFk9G8mmDGLmrZO/cnlLMTqmW12k7ttu2XvJDu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5H/EtVH21bFl0P3i0J/qqShUJPTbEUYTnOZ3u7TZSLUCLL95Mh6YoI7kkHfFQyRXaoSWPO1Rn6IOPgjVkjj3AUKXx6WX/laaR/nX7BpsQf+Sy0WOYkptm4GHjU1IkrqjW/fNkTwmCnp/NJVx8n44PkoFfOYnXsTftAKCXJe0zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7W7kxzw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7W7kxzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724069306; x=1755605306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RWyAIFk9G8mmDGLmrZO/cnlLMTqmW12k7ttu2XvJDu8=;
  b=L7W7kxzw83ZePn6kzZ41EbNH9/Ha0jNoGqgBKCoopZR4FBBtpbqqBv8r
   jb7oEojBlkhhpaBzSL4KecPSrQwr3hvTIM2pADPGbMepmE4F/0Kb331y1
   KHp5PBsjTcWG6/uGJE+ySNAVkouJHbm0kg+5Tid47nVGY/IihLSy0qvN6
   yM/1iwVifL0aXjjNyLUJtBmgextq+iCT3juWeVVWJyHtLVPmnPUpuEHfa
   ey1f5J8z93HcfpQkOUhviuAqYAIjV9h/czQ+P6v5euQUlnmdnHMqTXzh9
   VRIa5AN0APzeoL/zDVCfodJeoqHwwnxAtcdDmZfzXAssVVDL46m4HBFDK
   g==;
X-CSE-ConnectionGUID: aKVg8RkyQ/2hnGsiAHUqGw==
X-CSE-MsgGUID: qKyuVpAfSbWESQ+0lHZsWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="32931390"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="32931390"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 05:08:25 -0700
X-CSE-ConnectionGUID: kHmAH+33TNOjgVyrOu/O0A==
X-CSE-MsgGUID: Xe7CVMajRsiXlJ2H/m3B0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="64514648"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 19 Aug 2024 05:08:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id B971F2D8; Mon, 19 Aug 2024 15:08:19 +0300 (EEST)
Date: Mon, 19 Aug 2024 15:08:19 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Yuan Yao <yuan.yao@intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Yuntao Wang <ytcoode@gmail.com>, Kai Huang <kai.huang@intel.com>, 
	Baoquan He <bhe@redhat.com>, Oleg Nesterov <oleg@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Kevin Loughlin <kevinloughlin@google.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, cho@microsoft.com, decui@microsoft.com, 
	John.Starks@microsoft.com
Subject: Re: [PATCH v3 04/10] x86/insn: Read and decode insn without crossing
 the page boundary
Message-ID: <dekciupp32nqq6lpqecpwpoictme3b3qw5ha3rxaxhdbl6ba34@622ualchvsvt>
References: <cover.1722862355.git.legion@kernel.org>
 <cover.1723807851.git.legion@kernel.org>
 <9704da6a35d62932d464d33b39953fc5b2fd74ea.1723807851.git.legion@kernel.org>
 <3xcmaxmpoemmotdqhtr5fu52wyssixyvnmirqbbnvhwpcuss5z@sayg725h5wcz>
 <ZsMy1YaHI4gaN703@example.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsMy1YaHI4gaN703@example.org>

On Mon, Aug 19, 2024 at 01:56:05PM +0200, Alexey Gladkov wrote:
> On Mon, Aug 19, 2024 at 01:48:11PM +0300, Kirill A. Shutemov wrote:
> > On Fri, Aug 16, 2024 at 03:43:54PM +0200, Alexey Gladkov wrote:
> > > From: "Alexey Gladkov (Intel)" <legion@kernel.org>
> > > 
> > > In case the instruction is close to the page boundary, reading
> > > MAX_INSN_SIZE may cross the page boundary. The second page might be
> > > from a different VMA and reading can have side effects.
> > > 
> > > The problem is that the actual size of the instruction is not known.
> > > 
> > > The solution might be to try read the data to the end of the page and
> > > try parse it in the hope that the instruction is smaller than the
> > > maximum buffer size.
> > > 
> > > Co-developed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > > Signed-off-by: Alexey Gladkov (Intel) <legion@kernel.org>
> > 
> > I think this and 3 next patches do not belong to this patchset. They
> > address separate issue that is orthogonal to the patchset goal.
> 
> Should I drop them from this patchset and send them after this patchset as
> a separate change ?

Yeah. I think so.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
