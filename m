Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631051843
	for <linux-coco@lists.linux.dev>; Wed, 22 Jun 2022 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655907230; x=1687443230;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+EXRl6WV5FG4M9RIL6Oi04vvsi30kRgWRes9pKk2Hh0=;
  b=RLPsQhB0cbnne3vwwaGA6Nyk/Arj+qFMKejjjQ7M/0TsKxgO70AIKLYi
   vfLuqZDEDrfF3WCAJ2UIH7IV8HEpFbiN3Nw+Azu6bh1qmhIACm65qUTmb
   UzycwPa2EV6gpolb2tHQ/rEYNQXr53uCSQB82ZxwBvDh948gnL2Zd2f9z
   qv/8m/TapMZ2c9Y3nbuB28se6bdSVZlvAsCillff3odK8qlAFrs9HufyF
   32FNGbOAYXYPJ5XhZTo5W+7XmtQ7xeszKF2JujYBt5//yu3IXvpDZimNG
   FH3RVaQa1IxIdJH5bhu3PENYTm6Izc2QTYi975+XuN3ut8rwzVldKCTq3
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="263460585"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="263460585"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 07:13:46 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="677555339"
Received: from bshakya-mobl.amr.corp.intel.com (HELO [10.212.188.76]) ([10.212.188.76])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 07:13:44 -0700
Message-ID: <cc0c6bd1-a1e3-82ee-8148-040be21cad5c@intel.com>
Date: Wed, 22 Jun 2022 07:13:26 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH Part2 v6 05/49] x86/sev: Add RMP entry lookup helpers
Content-Language: en-US
To: Ashish Kalra <Ashish.Kalra@amd.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-crypto@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de,
 thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org,
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com,
 slp@redhat.com, pgonda@google.com, peterz@infradead.org,
 srinivas.pandruvada@linux.intel.com, rientjes@google.com,
 dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, michael.roth@amd.com,
 vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com,
 tony.luck@intel.com, marcorr@google.com,
 sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com,
 dgilbert@redhat.com, jarkko@kernel.org
References: <cover.1655761627.git.ashish.kalra@amd.com>
 <8f63961f00fd170ba0e561f499292175f3155d26.1655761627.git.ashish.kalra@amd.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <8f63961f00fd170ba0e561f499292175f3155d26.1655761627.git.ashish.kalra@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/20/22 16:02, Ashish Kalra wrote:
> +/*
> + * The RMP entry format is not architectural. The format is defined in PPR
> + * Family 19h Model 01h, Rev B1 processor.
> + */

Let's say that Family 20h comes out and has a new RMP entry format.
What keeps an old kernel from attempting to use this old format on that
new CPU?
