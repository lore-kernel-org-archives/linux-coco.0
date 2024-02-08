Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746DB6F097
	for <linux-coco@lists.linux.dev>; Thu,  8 Feb 2024 13:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707399786; cv=none; b=gPyPaGei852hp2mgstedbomz6H96AzunMqtUZGGPRjpPcBIVYjC8hDW9exVi5hioyjORkXUT5XAKaVzrDhdG1qeh8BwCLrsxw71u2BNRBpRd5Ve1B5JomD5GDdAoHIpL/JOfNfIiedij9n5WpA88L05rRcvnbWIHkkI3EELhwd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707399786; c=relaxed/simple;
	bh=Lk+lnICjyzdSOAN6ElSfws1jJHVhMjD8WqdjhE/qtKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rnv8CIAcffZFTgSn4T68HmD1QbChZODEP9NoGj+Md3Q5mhVyO8YbjGiw54k9iQl5WBGADZA2IWqDBwa3NWq41b/4E2/vkxQLDoeZ5B47Erw69TNEEkaV2kNIpsZy2ZzuXljRcYAhS/+bkVdgaxbOaQy9WGs9Ye1PAKNT+ROM65M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXG6dv//; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXG6dv//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707399784; x=1738935784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lk+lnICjyzdSOAN6ElSfws1jJHVhMjD8WqdjhE/qtKI=;
  b=DXG6dv//jSYBXdsWTDMUuSJs5RLpM9KUXVKxW0l45ffw4KGc/5hcJjRg
   OBt1u0KnCtUzV6MR8B3tTCBuuJg5YWDqJE2RrJDZN/AfLh2zUQ7XOe7Bl
   IYdp5nBsyziqy7xIT4onxjKK7eKf3DhjMtm9X/tbMA8vlyn5kC5Fhl6WB
   DLKJSZ8PVIEvsWcNgDCAv9MLGq6GfMweiVAvYqkRtMkCK96AE0P0B31ko
   VECnCZI5Y17aYeeQeVQqu3f6aRQMSZYH+7PlElomV0iemcVXZvZ4nvXHA
   VRZ1G/5mOtvEQrmNTaAJy9//VUw2PRgRNBKvYc2zEV04z8KeOYpnAsUC4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="11952049"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="11952049"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 05:43:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="24901795"
Received: from jelyouss-mobl.ger.corp.intel.com (HELO himmelriiki) ([10.252.43.19])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 05:43:00 -0800
Date: Thu, 8 Feb 2024 15:42:51 +0200
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>, linux-coco@lists.linux.dev,
	x86@kernel.org, dave.hansen@linux.intel.com, dionnaglaze@google.com,
	dan.middleton@linux.intel.com
Subject: Re: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface
 for quote generation
Message-ID: <ZcTaW3gKIWWF1fKS@himmelriiki>
References: <20240124093858.1818497-1-nik.borisov@suse.com>
 <e8c2043a-a872-43ff-b079-ebbbfa6cb743@linux.intel.com>
 <65baa477b8da8_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
 <59f268c4-8491-4256-8766-664a8ee0ffd8@linux.intel.com>
 <65bab6ef2a198_37ad2948b@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65bab6ef2a198_37ad2948b@dwillia2-xfh.jf.intel.com.notmuch>

On Wed, Jan 31, 2024 at 01:09:03PM -0800, Dan Williams wrote:
> Kuppuswamy Sathyanarayanan wrote:
> > 
> > On 1/31/24 11:50 AM, Dan Williams wrote:
> > > Kuppuswamy Sathyanarayanan wrote:
> > >> + Dan Middleton
> > >>
> > >> Hi Boris,
> > >>
> > >> On 1/24/24 1:38 AM, Nikolay Borisov wrote:
> > >>> IOCTL based interface was the natural choice for interacting with the
> > >>> quote generation machine at a time when there wasn't anything better.
> > >>> Fortunately, now we have a vendor-agnostic, configfs-based one which
> > >>> obviates the need to have the IOCTL-based interface.
> > >>>
> > >>> Gate the relevant code behind a Kconfig option, clearly marking it as
> > >>> deprecated as well as introduce a runtime warning.
> > >>>
> > >>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> > >>> ---
> > >> In the following thread, Dan Middleton raised a point about this interface
> > >> being used for local attestation use cases.
> > >>
> > >> https://lore.kernel.org/all/ZbAaKAh-230Hj4BF@redhat.com/T/#m691dae9a7833a35552cafb597c838df9c2ed5f3a
> > >>
> > >> Currently, the configfs-based ABI does not support the local attestation use cases.
> > > What are local attestation use cases, and what happens if Linux does not
> > > provide a local attestation interface and standardizes on remotely
> > > attestable as the standard?
> > 
> > 
> > Local attestation is used by one TD on the same platform to prove to another TD
> > in the same platform about its identity. It is mainly used in cases where a TD provides
> > some special services required by other TDs. Since they are all in the same platform,
> > there is no need for a 3rd party verifier or Quoting service. It can use the verifiable MAC
> > to check the correctness of the TD.
> > 
> > I am not sure about actual local attestation users. May be Dan can share that info.
> > 
> > Regarding your question about using "remotely attestable as the standard", I think
> > remote attestation can handle all local attestation use cases. But, does it make sense to
> > force users to run a Quoting service if they don't need to communicate with 3rd party
> > servers?
> 
> SEV-SNP seems to get by without a local attestation flow, if I am not
> mistaken, so the question is why should the kernel support cross-vendor
> divergence here? Remember, the kernel ends up being the "standardization
> body of last resort", it does not need to onboard all the complexity it
> can find.
> 
> > SGX also seems to have local attestation concept
> > 
> > https://sgx101.gitbook.io/sgx101/sgx-bootstrap/attestation/inter-process-local-attestation
> 
> I am less concerned with concepts, and more concerned with use cases.
> For example it could be the case that configfs-tsm needs to grow to
> support local attestation for multiple vendors, but that should be due
> to concrete use cases to be deployed, not theoretical observations.

Confidential Containers project started using the tdx_guest ioctl() to get
the TD report. This is used by the attestation-agent to check that the hash
of a policy file is correctly included in the TD report's MRCONFIGID field.

The report stays within the TD and there's no need take it to the host QGS
quoting service for signing. Right now we need to go to configs-tsm for
the quote and tdx_guest ioctl() for the TD report.

The corresponding SNP check in this use case is to get the HOSTDATA report
field by using 'get report' ioctl() (non-ext version is enough). With
configfs-tsm this is same as using just 'outblob' and ignoring 'auxblob',
AFAICS.

However, perhaps some generic report 'type' TSM report attribute would be
justified here to allow users select between TD report/quote and
report/ext_report generation?

-- Regards, Mikko
