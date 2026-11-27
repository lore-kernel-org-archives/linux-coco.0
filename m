Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793869;
	b=pPhiXImij1uaZT1CJCESeZsHlW2OmgNMLx9iFrwozennDFbJY45HrqOlzSRB1YOCK9WC
	 JA6ZXiv2VKu3qw9uZDg0QlUC8SoovbKcJ/n9ezxikLu7L+DG4UwqGv+9P81bqSNjVMU0S
	 DsXK5dK44N6roeIvcTNB2cGW46LhALlf4DcF4usDERMzjOrsdhUwELt4UMDQreBmgC4BB
	 a56AorNTMb+pfpwwVguasST+ZlzsfC0OTdq33NhKrDUN6SJKCubr2ixTDznzQe8DryrOw
	 4gXXoJMuVq7EhXvpPRblGRuZp0UTolkFVhsrgCOc7RVSbOQ+1iM0aSf/KynDQWNV11Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793869;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:In-Reply-To:X-Scanned-By:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition;
	bh=AWsY6gF0fsVDqvH/4ZMLK8d5IyM2JRwhdPFY54zOmUo=;
	b=AirhM0u5E+RCoN+VHB1beCf5ZEaPZWm9UkxKJTtLM4oAmZgps3Tf+mKj2T+a95KhKncL
	 0/X9/I03uVZ/m/Bg4aXyixDm4CW7iMvk9cum2QMnK/FFicwVDdHIC4tsLp/z8Qk+T8FpS
	 RFwCsmC6mrKQD5ofeR8dHuE9xo6qd3wVM2eVdFqnLEfSXw+d5aSWMdXj+StD9a1jGx9lF
	 wITwbHfw6OIo4YXGP7Zf1Z3S7N80CiCLtOfm9Zw/SVmIVa4jWqBZ/lD+bohmgg5b87oPF
	 lrq99SUBRXGWoCApf2ftypaDiAWjnXPdx0Gk3xiuova9lKijQvJ6OXwUPWb8jNjoMAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VHHpn2xR;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D65B606A333
	for <linux-coco@lists.linux.dev>; Fri, 27 Nov 2026 15:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D65B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VHHpn2xR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795793867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AWsY6gF0fsVDqvH/4ZMLK8d5IyM2JRwhdPFY54zOmUo=;
	b=VHHpn2xR3aA2LY1o19DjfLukUpgSQetxMKAluI5cWo7EZUaJbRfifzLogYHZMeEx/cn8tF
	woLSToq8fooPQnyBQCdjlHGpKWemR6NJQOvB32vCMD4sHxbbNfUV+X9pJKMp7tzPqCApH2
	D9OQ/Jf9cbfALgshDUZ97tNkMIyFIx8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-b1UZVrUOMZS6UQWkVZu-fw-1; Fri,
 27 Nov 2026 15:37:42 +0000
X-MC-Unique: b1UZVrUOMZS6UQWkVZu-fw-1
X-Mimecast-MFC-AGG-ID: b1UZVrUOMZS6UQWkVZu-fw_1795793861
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7608E1955F45;
	Fri, 27 Nov 2026 15:37:40 +0000 (UTC)
Received: from nucbdw.ghoffman.csb.home.kraxel.org (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BDCC31956042;
	Fri, 27 Nov 2026 15:37:39 +0000 (UTC)
Received: by nucbdw.ghoffman.csb.home.kraxel.org (Postfix, from userid 11758)
	id 9DBFE40774E0; Fri, 27 Nov 2026 16:37:37 +0100 (CET)
Date: Fri, 27 Nov 2026 16:37:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, 
	Mahmoud Nagy Adam <madam@amd.com>, coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: Discussion on policies around minimum rust version for
 coconut-svsm
Message-ID: <awmeo3YNfKSxVkSO@nucbdw.ghoffman.csb.home.kraxel.org>
References: <d79ddac2ab65877504ace5a1fa2eab9cab3d5db3.camel@HansenPartnership.com>
 <65vkyfqwo92zb.fsf@amd.com>
 <awglpsRXwJRS7aa5@8bytes.org>
 <ef51cb7df408839ce80921d9133020c46da3c27a.camel@HansenPartnership.com>
 <awkz05_7U4lmN17K@nucbdw.ghoffman.csb.home.kraxel.org>
 <c84cba39a4bc68a20efca97b617cddf107761838.camel@HansenPartnership.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <c84cba39a4bc68a20efca97b617cddf107761838.camel@HansenPartnership.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bPkyiDpm2M67R_4sZTXrh0NP4res1DYTz-obQNVr0B0_1795793861
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hi,

> Would I be right in guessing it's just Cstr16 and the variable
> interface you get from them?

Yes, for the most part it is support for those uefi strings.
Also Errors and Status codes.

The variable interface is actually internal, but it needs
parse uefi strings ...

take care,
  Gerd

