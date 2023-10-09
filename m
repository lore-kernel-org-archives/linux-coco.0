Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3AD22F00
	for <linux-coco@lists.linux.dev>; Mon,  9 Oct 2023 13:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhNIc8q9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696858516; x=1728394516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a8KWFLu3eVLALOO0s2Gfw3D3r4t41MgJmAmOQhK1GqY=;
  b=nhNIc8q9nSlAArw2OjoRADUbM6MfzhVGVavpM6eu7SmrhoW0MbrU0EZu
   AYgaOn/IALDkXalqC1wrbiM+SDEQqm8I/pWGx/5lgvVWdb8iIAwHLjq6T
   XtK3fFB+D0N8JWketBhgIDOcApMENpPxFOj677Y0nOaa50y4dbTzJEeLC
   UlebcsbYBFWTaypvVlrZNDnWz5kktQAvZxxd7sHXXFs3+x3gkd5phhpKe
   qWIMZumCLnZX7NHlmPu5Es/9fSySTuzbsPRGHFBQX2qM3XR27vzhbODG2
   9XJjykg2QEOxgvuWScSs3tGV7vQQb6Hcm5zk8fsgaydjmBbNGawhCUIym
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="448332830"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="448332830"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 06:35:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1000209164"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="1000209164"
Received: from ahuge-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.40.233])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 06:35:03 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 6EDC110A196; Mon,  9 Oct 2023 16:35:00 +0300 (+03)
Date: Mon, 9 Oct 2023 16:35:00 +0300
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
	Tom Lendacky <thomas.lendacky@amd.com>, kexec@lists.infradead.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/13] x86/tdx: Convert shared memory back to private on
 kexec
Message-ID: <20231009133500.su4ylwpbnaiyln4d@box.shutemov.name>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
 <20231005131402.14611-11-kirill.shutemov@linux.intel.com>
 <ZSJpzw2e7KgtJAZy@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSJpzw2e7KgtJAZy@MiWiFi-R3L-srv>

On Sun, Oct 08, 2023 at 04:35:27PM +0800, Baoquan He wrote:
> On 10/05/23 at 04:13pm, Kirill A. Shutemov wrote:
> > TDX guests allocate shared buffers to perform I/O. It is done by
> > allocating pages normally from the buddy allocator and converting them
> > to shared with set_memory_decrypted().
> > 
> > The target kernel has no idea what memory is converted this way. It only
>       ~~~~~~~~~~~~~
> > sees E820_TYPE_RAM.
> 
> I finally realized it means the 2nd kernel of kexec rebooting. Maybe we
> can call it 2nd kernel always, it works for both kexec and kdump
> jumping. 

Okay. Will fix. I am new to kexec and I don't know proper terminology :)

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
