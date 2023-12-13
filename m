Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A843928DB5
	for <linux-coco@lists.linux.dev>; Wed, 13 Dec 2023 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fab8wlvz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702468944; x=1734004944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sU1cY2onLnbpQIDRhHnFwFsomusAlQI0iUZ6jEcMyVk=;
  b=fab8wlvzGEqstL0SY8VG5Xdr7+nLwwYvrLDt21w/cR7pB1eOONPUVAEV
   18REAz9YoWsipX1e4Aap+qOZpt8UAPlGdrVmJmTGBai05MR6itGpqKfRG
   6Ey15l9u5fQAsvVAOJcfhF2wx0XGU1tAck7je3SebKHPtQ/JlxwvrCmDp
   zUeD3yN2VdN9N8CqGz1TMLPF2Wi6iGJCx+nTQNqPfvOJWxsekvUBAbBvG
   I/55JS1IiIoplsG90wtV1aRNiT047p71YRidaa10gQ6i/PFtZX7BfVJK4
   0CObSWMRqm2Jtq6YWMamR6UYyz4dp1xwGabsfdsE5yx0rb7xKV98hgRsu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="2093796"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="2093796"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 04:02:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="891991996"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="891991996"
Received: from gschoede-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.33.110])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 04:02:18 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 51E7810A4DA; Wed, 13 Dec 2023 15:02:15 +0300 (+03)
Date: Wed, 13 Dec 2023 15:02:15 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Yuan Yao <yuan.yao@intel.com>, Kai Huang <kai.huang@intel.com>,
	Tony Luck <tony.luck@intel.com>, Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86: tdx: hide unused tdx_dump_mce_info()
Message-ID: <20231213120215.64wcryk5k75cymop@box>
References: <20231212213701.4174806-1-arnd@kernel.org>
 <39cf0ad5-bbef-4fb9-81a3-9d2891cc7450@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39cf0ad5-bbef-4fb9-81a3-9d2891cc7450@intel.com>

On Tue, Dec 12, 2023 at 01:42:09PM -0800, Dave Hansen wrote:
> On 12/12/23 13:36, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > When TDX is enabled but MCE is not, the tdx_dump_mce_info() function
> > fails to link:
> 
> Thanks for the report, Arnd.
> 
> The only way that TDX has to report integrity errors is an MCE.  I'm not
> sure it even makes sense to have TDX support but not MCE support.  Maybe
> we should just make TDX host support depend on MCE.

I agree. Silently ignore integrity errors is not good idea.

TDX module spec also supports it:

"The machine-check exception handler is expected to be implemented in the
VMM."

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
