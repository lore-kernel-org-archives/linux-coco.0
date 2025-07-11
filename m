Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9FE2D3A8A
	for <linux-coco@lists.linux.dev>; Fri, 11 Jul 2025 13:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752240644; cv=none; b=mQL2xO4/JdhyPrNpF0EjvImNdPJhLtWk7gMi6ZGABRTMtqus1rDkEBVkW6h9NrjQy5DtRb6g7Or8/z3vm6HU6WUwaNtBYGCBZy2++i2COGuTgsLRcf93kKMPXuV1I4kr8eDKm2SFyFJp5ccVlgQV48TsKKEn0B+kKuJH6jKUpy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752240644; c=relaxed/simple;
	bh=6qYCdL4eUWzIJytcMLAQj4G6cl0MK9VLNnRVheqb3uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=P9NFcxutOI1aFxTfvNNH+nRDRtURTjs4HmIMhSvNvpgWkP10wDtUNh/Mzp7g26jY9eFlRo/nJMShpjBv47bgvxinlHCgai8LTCGzJARDTFEgPopM61PZfesYbRATgUM0hEeF+dwbJliFFDjMoqy9VcWbgWA79TH+9wF4sL7OjbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aWsk1skP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aWsk1skP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752240642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SyTp8Prip+kBWBbrGW1r47Nl5zxY1T5Awq+di+Gh4Ec=;
	b=aWsk1skP64kpNGo2rsv7z0kNiFw4CC6CDHr7p25QDxiZXdu7g3vn5IyCZWiAxO0nTMslyx
	/z4pnGQ/rhxy1qq80O8oN4MOe7Abgo7G+DJEorBRvWw2rC7PiyjtGy4hmYlfZLxaqNxqQ0
	G6JwF+xmD3GN/y43AtAcul2wfc/+B8s=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-363-5RRNyl_lM86FGb9gaeYj5w-1; Fri,
 11 Jul 2025 09:30:39 -0400
X-MC-Unique: 5RRNyl_lM86FGb9gaeYj5w-1
X-Mimecast-MFC-AGG-ID: 5RRNyl_lM86FGb9gaeYj5w_1752240638
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DD9B91809C87;
	Fri, 11 Jul 2025 13:30:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.214])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F01953000221;
	Fri, 11 Jul 2025 13:30:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 9B06B1800393; Fri, 11 Jul 2025 15:30:34 +0200 (CEST)
Date: Fri, 11 Jul 2025 15:30:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jon Lange <jlange@microsoft.com>
Cc: "Relph, Richard" <richard.relph@amd.com>, 
	=?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [EXTERNAL] Re: SVSM Development Call July 2nd, 2025
Message-ID: <auq7txxlerpwzl542o6rkjams22cy6rb2xoi3f7lbej6u47svi@rto2jldlvxyh>
References: <sn6mqb3jmijz2mxur2fxow4wp55ljfiwhem5qzsoeavhsutjbv@iaunp2gqfs4g>
 <lirgc4cvbgr7wxuci2paqggsdzw2wcfmn2dtg6urorqmjpjhtk@bof63sgjpihg>
 <vpwzlcdbpu3kdshsgfshwfldqm5wtcesblwa7gzwyaf3tgtqwp@2vh37q57z2xe>
 <4qbnbdno6hof3llfemhxc4prm7x2vzpqmvjknykelucpqhyryz@kbgpmaoy7vmz>
 <4b862033-9c53-47ec-8eae-e9c9ce7d7d7d@amd.com>
 <cvrqixqf3odaxgpz4uzwtkfkbmgbyrndzgyl7mhlbs6vj6fnpp@5aqnndt7rm6q>
 <d579919f-6e66-4499-8634-e258af61c933@amd.com>
 <aq6225hfazqsbqgx6fhj2klst52wdfivfa6xj2ost65sg5fq2r@4yoqnv2tp5nm>
 <LV5PR21MB5210A051A344852EC30C089CCA48A@LV5PR21MB5210.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <LV5PR21MB5210A051A344852EC30C089CCA48A@LV5PR21MB5210.namprd21.prod.outlook.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VFL0DHkhvOl6kMh6F0XsKRKJwMYaRTWmBmlmgptAqL4_1752240638
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 10, 2025 at 04:32:58AM +0000, Jon Lange wrote:
> > i.e. support for SVSM_CORE_DEPOSIT_MEM ?
> 
> No, the SVSM knows the full memory map at boot time and therefore can
> know the amount of memory required for all bitmaps as part of its boot
> flow.  The simplest approach will be for the SVSM to carve out
> whatever memory it requires, and to tell the guest (OVMF) what memory
> it has claimed for itself.  There is no need for additional bitmap
> memory unless the guest support memory ballooning, which I think we
> can consider out of scope for now.  So the question is what is the
> best way for the SVSM to advertise its carve-out to OVMF. 

OVMF doing svsm calls for this should work fine (didn't actually test,
but OVMF does memory validate calls quite early at boot, so I don't
expect blockers).  A protocol along these lines should work I think:

memmap call #1

  IN  RAX    $protocol.1
  OUT RCX    number of entries

memmap call #2

  IN  RAX    $protocol.2
  IN  RCX    entry index
  OUT RCX    entry index
  OUT RDX    entry type (e820)
  OUT R8     entry address
  OUT R9     entry size

Comments?

take care,
  Gerd

