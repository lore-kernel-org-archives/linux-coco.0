Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AE619472
	for <linux-coco@lists.linux.dev>; Fri, 22 Mar 2024 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711097540; cv=none; b=gjHloL7BhcMjVRq5FVmjzNstx99FLgm/ZKJmP9Gmz4lU2GmW4Se+1EeBvG5/WzBZ83QZ0qPZ9N39W+ND0RYgBSAhrwTt7J/vyZQ7Pm9XCXsxTTWpMf6gS8CDhfcR60CNwDAl2T87ZUiNLjXZcwJNbfZ+WZdxpnrgM9KJ8nBCLeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711097540; c=relaxed/simple;
	bh=/RN37zr1IX1Mb4CsYjKBZYWIbnZDq3i1kPfUN1adl1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=olW57FqHLzv+H8Mxjuw+FwL15x1AmUc3hmZ3J4R4nThT9IL6EtawPPrIHEvkI8/tmMLIZO3VUPhRG1q2Cw2GgACMKGT1rcwRSVnEedosd1MovfVpghE96CZ4s2uWj8kF1J6AMUfVkwKW8Qfq17m3+y6efGWHndffUigjiIKKUSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jRpjtkw9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jRpjtkw9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711097537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EZJ+hHKCEJWt7FOyaWchxKaQdV3eosUzNdrXXoIjhu0=;
	b=jRpjtkw9kQxosd40S3WdnY5xAQujml1FuivVAMCS09uM8CL1l2JQweePZKBjlpjjrV3eF7
	FYKqznkxYWApXqiIpB2LnN4RGVA23GI4BkLuPKM7T2x5PHUHLZmjoga6Obz7R1nedczQ6O
	VUkGw8cTHpkK4tvvdYnt1IXdVif8Jkk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-Cixhu4eCOoSd1-1_R50ACA-1; Fri, 22 Mar 2024 04:52:11 -0400
X-MC-Unique: Cixhu4eCOoSd1-1_R50ACA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B4BD85530C;
	Fri, 22 Mar 2024 08:52:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.134])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F6201C060CE;
	Fri, 22 Mar 2024 08:52:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id E1E7518014AE; Fri, 22 Mar 2024 09:52:04 +0100 (CET)
Date: Fri, 22 Mar 2024 09:52:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Yao, Jiewen" <jiewen.yao@intel.com>
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>, 
	qinkun Bao <qinkun@google.com>, "devel@edk2.groups.io" <devel@edk2.groups.io>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Aktas, Erdem" <erdemaktas@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Peter Gonda <pgonda@google.com>, 
	James Bottomley <jejb@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Subject: Re: [RFC PATCH] OvmfPkg/SecurityPkg: Add build option for
 coexistance of vTPM and RTMR.
Message-ID: <u76teout4bwpg5yoklah6xfkrpcn4lw5nosw5lmph7sfjipqnz@gagzyh3xrkie>
References: <94521f20aa2872c1b8f018b7db31eca4a2b8222d.1711039409.git.qinkun@google.com>
 <CAAH4kHbAi=Jn7Lw82idGGmQYnAhJnhoS9u8wBMOZsp7iLiOWxw@mail.gmail.com>
 <PH0PR11MB587959168F72B20E0AC836438C312@PH0PR11MB5879.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR11MB587959168F72B20E0AC836438C312@PH0PR11MB5879.namprd11.prod.outlook.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 22, 2024 at 02:39:20AM +0000, Yao, Jiewen wrote:
> Please aware that this option will cause potential security risk.
> 
> In case that any the guest component only knows one of vTPM or RTMR,
> and only extends one of vTPM or RTMR, but the other one only verifies
> the other, then the chain of trust is broken.  This solution is secure
> if and only if all guest components aware of coexistence, and can
> ensure all measurements are extended to both vTPM and RTMR.  But I am
> not sure if all guest components are ready today.

As far I know (it's been a while I looked at those patches) shim.efi and
grub.efi have support for EFI_CC_MEASUREMENT_PROTOCOL, but use the same
logic we have in DxeTpm2MeasureBootLib, i.e. they will not measure to
both RTMR and vTPM.

Looking at systemd-boot I see it will likewise not measure to both RTMR
and vTPM, but with reversed priority (use vTPM not RTMR in case both are
present).

Linux kernel appears to not have EFI_CC_MEASUREMENT_PROTOCOL support.

> Since this option caused a potential risk / misuse breaking the chain
> of trust, I recommend we have at least one more company to endorse the
> runtime co-existence of vTPM and RTMR.  Also, I would like to hear the
> opinions from other companies.

Rumors say intel is working on coconut-svsm support for tdx.  That will
most likely allow to use a vTPM with tdx even without depending on the
virtualization host or cloud hyperscaler providing one.  We will see VMs
with both RTMR and vTPM and surely need a strategy how guests should
deal with that situation, consistent across the whole boot stack and
not every component doing something different.

Given that the vTPM might be provided by the hypervisor and thus not be
part of the TCB I can see that guests might want use both vTPM and RTMR.
So, yes, for that case coexistance makes sense.  I'm not convinced it is
a good idea to make that a compile time option though.  That will not
help to promote a consistent story ...

take care,
  Gerd

