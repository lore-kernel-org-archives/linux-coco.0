Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC9B3C075
	for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 09:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFbjlvAP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700560206; x=1732096206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H2d/tvMIoDvHSQUHPlRsf/csrATiDrGE2RPrh/3LADw=;
  b=DFbjlvAPFdCq2Da1a4hfbc/5BmMtKSy26xiYjKcR5jpuhpwPBORLgGHH
   fL75jK171DqclyidrOE+rKP9JQZeXvqyQFg18qPMl/jWr2JJOmuQlT7Ri
   9NGuXuDO4I+P3MLO+ELlDygIV3D1472xYb+fRn7KPs3QKNLIrBw8QUeRg
   YKrjuTKQTydTXIS1lXDb7d15JD2NU4PGaTd2t9Qkv9phdt8btmOHYyrCY
   bbSJyApg52STIqKelvJFVF5Z1gqrp+1EzLadFxdpOzJMXzENmjdQus9ZY
   +9FjSsMs5tbZnQydZIVMc7Rg3dO2w53PceIlgYZRPdjtL/xLOyl2HrG2K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="376840532"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="376840532"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 01:50:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="766585803"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="766585803"
Received: from ikosarev-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.40.84])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 01:50:01 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 5AEF110A36E; Tue, 21 Nov 2023 12:49:58 +0300 (+03)
Date: Tue, 21 Nov 2023 12:49:58 +0300
From: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"Nakajima, Jun" <jun.nakajima@intel.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"Hunter, Adrian" <adrian.hunter@intel.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"ashish.kalra@amd.com" <ashish.kalra@amd.com>,
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>,
	"seanjc@google.com" <seanjc@google.com>,
	"bhe@redhat.com" <bhe@redhat.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCHv3 09/14] x86/tdx: Account shared memory
Message-ID: <20231121094958.sagzaclakdnexd7a@box.shutemov.name>
References: <20231115120044.8034-1-kirill.shutemov@linux.intel.com>
 <20231115120044.8034-10-kirill.shutemov@linux.intel.com>
 <07e7619d098ba3579f642a97b644f256884ed0a2.camel@intel.com>
 <20231121094219.x5ez6ohzc773viul@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121094219.x5ez6ohzc773viul@box.shutemov.name>

On Tue, Nov 21, 2023 at 12:42:20PM +0300, kirill.shutemov@linux.intel.com wrote:
> > That being said, I think perhaps you can separate the /sysfs part as a separate
> > patch because it's not a mandatory part of this series but a nice to have.  Then
> > the /sysfs part can be reviewed separately. 
> 
> Okay, makes sense.

Hm. Without debugfs there's nothing really left in the patch. Accounting
itself is few lines.

I will probably leave it as is.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
