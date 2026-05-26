Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8785E38C412
	for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 15:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779810413; cv=none; b=DUoBjySYOfvptdWjNgyrPtIuiDt/A7qBqL4emL0+PrnFUieQ+y5cXhU/jOeUkYTO4TN5Jiz2HBTo49DjQSMN18jfQqttQIQDNPygg5Xn54q1Azuo/zbS3AYw3VXbtnHiETOUVTVhAKeOCAnmLRyVKrkoCKw03er5nGIWN7PELiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779810413; c=relaxed/simple;
	bh=kQ6MFm1RcBK5lthrtsS3tKwgEUgIjQSVP8M3aj6hNVQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=OprfJ0Oz1QMCFbukNJo9qQv5DRYBVNf4EVIBmxtJbycQcRslteWCSDcYaWD8/Zrfa+NgH2Gqn2uT6e8mgtJAPD4xzqZnQ4hs5Dvou25wwop/3zMFdqmVymZdo2FLH985yJqovubUJ/WU8Zamy2sRnlNZQjVht7Jk8OVXWQSOJaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B3NRYBW/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B3NRYBW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779810411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=coBt7Zb3aZ3ZG0mTYJhcJ0JzfkK/zs88iplrFlJsbyY=;
	b=B3NRYBW/aKu7iH2hU2rsyi5PVyofLZsjMVRIpFgcLfNoS4czZs4ZkXWSF+EvRcph9Oa434
	w5gCd/AnQ8AcySb8d7w46cgO+9QLcSXE1LHeapUNg1CG3XfZP2X1hHofG+Ny40A9LDFedM
	qiXeuJWDCs8EAqTP6/xPNdqZcDFbaEQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-eXPaSvm-OmSIU2_xjR9LhQ-1; Tue, 26 May 2026 11:46:47 -0400
X-MC-Unique: eXPaSvm-OmSIU2_xjR9LhQ-1
X-Mimecast-MFC-AGG-ID: eXPaSvm-OmSIU2_xjR9LhQ_1779810407
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd6aeb3637so251861935ad.2
        for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 08:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779810406; x=1780415206;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=coBt7Zb3aZ3ZG0mTYJhcJ0JzfkK/zs88iplrFlJsbyY=;
        b=FD+M8Hn9ZOgcE7oxqEEN5Q33TjM/hghQAvZlA3/WqEb30U/Ki/j/7Crzg+zM0vKkor
         vVWPbkA4d1OYJL0ez9pBn9+nqeGELhoV3leir+CKeIbP67WANdx2wA4M5VvpmV2y1c6+
         uDKKEM/TqVzIEGrxx7LsMTF3lYIhYPLqcW5sOvuR1bBBLHenpYz36KFPrZ5ECYfsv3YV
         Y4c19lkfA/4g2B6iTX4eARLU7LOZqL/DqV99PRRsWP5QFv89isOt7+kwvcCnvHofcm/m
         bYE/6H6VPvzK2JXMB8rvvK0uDOS6oOQGiBWIqzf5WyvIe2f3ip1bZ1VfaFJ7GBpoYiC4
         8nRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FoiP0TfkL8JXsdGpFgD5XpwFHxJ+jK1cQbwZRmNlkRYIwRlGAjQ+xeBlRoCwFPxGg2XrRXX5EtVBO@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb2wx5Wx51H5QCGv3/2V7FIMvtj5g6DEiKWgZWGu41YzZOchC1
	r6wZb4iG6bZqm9OTsSduUUTiKRw6dg8nw6fEMLLW6sKwuouf3qX0a+303mXW8JSfNkdZfAf1mWM
	1sfqskHrfqS8WkHp4D95eM3HOQiluRnbU3193W1cGPtcSYwgiPaIM2Ap746dFlv+Z5myuXjx0Ec
	/t1uOeybxYs5IgbKOBs9xqnJJpTL6KbroU/HB29w==
X-Gm-Gg: Acq92OHLSYlWKxV5TisbrXRfT0h1bkq5Qu6rDd8JBldPK92UZwyiQi3S+grtweYjfsI
	7ZhfGUgKCIlN3FeFX9poEJQb48KCPxKC02KsH9G9aIgrMG5xuuYXOXAWyd2ukpcs/Suc+fpqe0r
	XM187GtNn7jGkEOzfNdHdvlA1BCztVWgZJ6HsAxJLOizqM0uTaAfhlHIQ7egWASTYL9Bj+2HTT1
	NRm
X-Received: by 2002:a17:903:390d:b0:2b9:8d39:5e87 with SMTP id d9443c01a7336-2beb0657112mr195127015ad.10.1779810406583;
        Tue, 26 May 2026 08:46:46 -0700 (PDT)
X-Received: by 2002:a17:903:390d:b0:2b9:8d39:5e87 with SMTP id
 d9443c01a7336-2beb0657112mr195126665ad.10.1779810405978; Tue, 26 May 2026
 08:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 26 May 2026 17:46:34 +0200
X-Gm-Features: AVHnY4L3nOjJR38ocxZeT7riD_InnfNotcXGoStd6H43t02pPyJbpziDl5UZVbs
Message-ID: <CAGxU2F5hP=7pA1rKRvq5sgr0t2y1YoUzYCmH8hzaCS58U4+Y3A@mail.gmail.com>
Subject: SVSM Development Call May 27th, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pSGi-FnhUl8erNHaNwDhZj99L4F5uJRiugj7MSl1jIs_1779810407
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the call for agenda items for this weeks SVSM development
call. Please send any agenda items you have in mind as a reply to this
email or raise them in the meeting.

We will use the LF Zoom instance. Details of the meeting can be found
in our governance repository at:

        https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

        https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,
Stefano

