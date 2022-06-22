Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2201843
	for <linux-coco@lists.linux.dev>; Wed, 22 Jun 2022 14:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655908011; x=1687444011;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=A7d2cHs1rusgGR62BUfFzsw6JwNIj4DohjCVILdINzQ=;
  b=Di/ALIGMk6saRaTdmtXwxaE0L9dr51J4MZA8r2lFRsGpInwE97eTzyHl
   4nqNuKgBupmV0E4f0MiG7yqcpwzxYYKfXplsxm1ygcXrFWD9h5tZfCEZL
   DoUBf4zjvgYAZnqS5XFmSYI7FSw3pBb05rk+ckECRe6tADhL4lsRYzMKz
   xYQj8TPHpaN85dWFjRY5DJ6ft6GXph97Nz6tSZ05KdTvkFuNThhQQA4M4
   9NNxw6WJzWRFB2I7dNAxXIo7yVQhyCMz5rFVmc3cpjiM6n/tWGZvSfF4+
   fnnsc082WwX8qc9eZm76sZuccDheaIKAKwW1SXNkTmIuHDzE7ziqKBR85
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="263464274"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="263464274"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 07:26:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="677569503"
Received: from bshakya-mobl.amr.corp.intel.com (HELO [10.212.188.76]) ([10.212.188.76])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 07:26:49 -0700
Message-ID: <d89c695e-7d45-160f-5e28-fee5ee576104@intel.com>
Date: Wed, 22 Jun 2022 07:26:31 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH Part2 v6 06/49] x86/sev: Add helper functions for
 RMPUPDATE and PSMASH instruction
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
 <e4643e9d37fcb025d0aec9080feefaae5e9245d5.1655761627.git.ashish.kalra@amd.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <e4643e9d37fcb025d0aec9080feefaae5e9245d5.1655761627.git.ashish.kalra@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/20/22 16:02, Ashish Kalra wrote:
> +int psmash(u64 pfn)
> +{
> +	unsigned long paddr = pfn << PAGE_SHIFT;
> +	int ret;
> +
> +	if (!pfn_valid(pfn))
> +		return -EINVAL;
> +
> +	if (!cpu_feature_enabled(X86_FEATURE_SEV_SNP))
> +		return -ENXIO;
> +
> +	/* Binutils version 2.36 supports the PSMASH mnemonic. */
> +	asm volatile(".byte 0xF3, 0x0F, 0x01, 0xFF"
> +		      : "=a"(ret)
> +		      : "a"(paddr)
> +		      : "memory", "cc");
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(psmash);

If a function gets an EXPORT_SYMBOL_GPL(), the least we can do is
reasonably document it.  We don't need full kerneldoc nonsense, but a
one-line about what this does would be quite helpful.  That goes for all
the functions here.

It would also be extremely helpful to have the changelog explain why
these functions are exported and how the exports will be used.

As a general rule, please push cpu_feature_enabled() checks as early as
you reasonably can.  They are *VERY* cheap and can even enable the
compiler to completely zap code like an #ifdef.

There also seem to be a lot of pfn_valid() checks in here that aren't
very well thought out.  For instance, there's a pfn_valid() check here:


+int rmp_make_shared(u64 pfn, enum pg_level level)
+{
+	struct rmpupdate val;
+
+	if (!pfn_valid(pfn))
+		return -EINVAL;
...
+	return rmpupdate(pfn, &val);
+}

and in rmpupdate():

+static int rmpupdate(u64 pfn, struct rmpupdate *val)
+{
+	unsigned long paddr = pfn << PAGE_SHIFT;
+	int ret;
+
+	if (!pfn_valid(pfn))
+		return -EINVAL;
...


This is (at best) wasteful.  Could it be refactored?
