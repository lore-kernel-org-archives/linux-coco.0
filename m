Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A27543AC0
	for <linux-coco@lists.linux.dev>; Thu,  1 Feb 2024 08:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706775329; cv=none; b=Wpcngel3Kb9qnU/bb+8wGQs4FlhqUHNsQ4okzrQy7B6zMibNh1ThQ1Pri7s394VmWaooyKfqnLwjCZ0twN8MhK7hUeD5v1fbD97LVL+gQNFp05XdFLsBQrvbxFNav2xSkvY1EzI6KWZ1adFs80VYR4c0liSuqv/E3PzK5/kgcUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706775329; c=relaxed/simple;
	bh=+hl3MulbJIcZd3qZtP9hoi8toi8Bac3oc+EfxJWLOIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LEA8wryh0mkdKfyX7kZyXk/796PfaZLmF8k/XN0k0iwHl1kCPB25m0P51AzHdCD5WG/LpgyMUh77Pm1NlgBv5XAeTZa5AdHyvlTAKzFUbKEnEdnWJa52mr/rqUcCgoOqOlKw0YxkB+Ah2NJO6fqERLmc4q24eLI0z/9E//IJ84U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TXGnOU6U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TXGnOU6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706775326;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bhZhfPqoa9HPDA4Ap1gFQwV4Q6xA+en5rvnxodzvMMc=;
	b=TXGnOU6Ub8MNQjbt/IJqFsFpDit64vMjzVyhomGgUBkLcn1DOIFF1DsSe2ie5SKyt5p/Pk
	jAG4eHLMN6LnWHe9V83TVCWpLKgzPzeHIlKTImqlBgRVUP1HGmrZ8WIri6T0esDRiKHkA9
	NIGSMCu+aEF8sYANBQ5bB82m4lzlI0A=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-414-W6RdqT-oO96k_i7uFa_eFg-1; Thu,
 01 Feb 2024 03:15:22 -0500
X-MC-Unique: W6RdqT-oO96k_i7uFa_eFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C24D1C06905;
	Thu,  1 Feb 2024 08:15:22 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECA77C0FDEF;
	Thu,  1 Feb 2024 08:15:20 +0000 (UTC)
Date: Thu, 1 Feb 2024 08:15:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>, linux-coco@lists.linux.dev,
	x86@kernel.org, dave.hansen@linux.intel.com, dionnaglaze@google.com,
	dan.middleton@linux.intel.com
Subject: Re: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface
 for quote generation
Message-ID: <ZbtS2I_R_2kRH_JP@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240124093858.1818497-1-nik.borisov@suse.com>
 <e8c2043a-a872-43ff-b079-ebbbfa6cb743@linux.intel.com>
 <65baa477b8da8_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
 <59f268c4-8491-4256-8766-664a8ee0ffd8@linux.intel.com>
 <Zbq04j1Av2znlKIC@redhat.com>
 <65bab7cdc650e_37ad294e1@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <65bab7cdc650e_37ad294e1@dwillia2-xfh.jf.intel.com.notmuch>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jan 31, 2024 at 01:12:45PM -0800, Dan Williams wrote:
> Daniel P. Berrangé wrote:
> > On Wed, Jan 31, 2024 at 12:44:46PM -0800, Kuppuswamy Sathyanarayanan wrote:
> > > 
> > > On 1/31/24 11:50 AM, Dan Williams wrote:
> > > > Kuppuswamy Sathyanarayanan wrote:
> > > >> + Dan Middleton
> > > >>
> > > >> Hi Boris,
> > > >>
> > > >> On 1/24/24 1:38 AM, Nikolay Borisov wrote:
> > > >>> IOCTL based interface was the natural choice for interacting with the
> > > >>> quote generation machine at a time when there wasn't anything better.
> > > >>> Fortunately, now we have a vendor-agnostic, configfs-based one which
> > > >>> obviates the need to have the IOCTL-based interface.
> > > >>>
> > > >>> Gate the relevant code behind a Kconfig option, clearly marking it as
> > > >>> deprecated as well as introduce a runtime warning.
> > > >>>
> > > >>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> > > >>> ---
> > > >> In the following thread, Dan Middleton raised a point about this interface
> > > >> being used for local attestation use cases.
> > > >>
> > > >> https://lore.kernel.org/all/ZbAaKAh-230Hj4BF@redhat.com/T/#m691dae9a7833a35552cafb597c838df9c2ed5f3a
> > > >>
> > > >> Currently, the configfs-based ABI does not support the local attestation use cases.
> > > > What are local attestation use cases, and what happens if Linux does not
> > > > provide a local attestation interface and standardizes on remotely
> > > > attestable as the standard?
> > > 
> > > 
> > > Local attestation is used by one TD on the same platform to prove to another TD
> > > in the same platform about its identity. It is mainly used in cases where a TD provides
> > > some special services required by other TDs. Since they are all in the same platform,
> > > there is no need for a 3rd party verifier or Quoting service. It can use the verifiable MAC
> > > to check the correctness of the TD.
> > 
> > As an example of where this might be needed, consider supporting a vTPM in
> > TDX. The TPM impl would likely be run in a separate service TD, and need to
> > be locally attested by the primary TD, to establish trust in the vTPM.
> 
> Service TDs are in active deployment? How does that work? A tenant pays
> the fees to host 2 VMs? Is that more economical than just communicating
> the remote verifier? Not trying to be argumentative just trying to get
> to the root of the question "why Linux must care about local
> attestation".

Any VM you buy has host resource overhead beyond the VM's declared resources,
and whether you realize it or not, as a user you are paying for this extra
resource consumption.

With KVM today, vTPM will involve each VM having a separate swtpm process
running alongside QEMU in the host, and of course QEMU itself has resource
consumption which can be fairly significant.  A Cloud provider will have to
take account of the additional per-VM overheads when calculating their
potential host capacity for running VMs & thus setting their VM price. 

In a TDX scenario this separate swtpm turns into something that runs inside
a minimal TDVM instead. The RAM overhead may be larger than with swtpm, but
for a cloud provider its merely one more factor to take account of when
setting their price vs host capacity.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

