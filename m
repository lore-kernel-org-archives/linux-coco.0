Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC8F18C38
	for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 21:53:19 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1c577fea3dcso12002145ad.2
        for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 14:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695333199; x=1695937999; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKedUbEi3B4plTooYCB0IKgIV3PycN404RmnO3IuMFM=;
        b=T/vXT7hXJGaVn2Wgt8kbj/fZEVd7hvF+p2UDAjPLH/piGTh0QZTKRA64yAW5lkd4S2
         ZC1PmIu0Ax0NnaAv05xGJwTYp0KlYhjIq+882CIe0h2FmHpfM/0K/R0rXu1be6NCBAY1
         nyiWC5V1nxI40CYTPbfGVYB36vL31IsrS5X29w2lFau6sXHfzZHeBbe6y4z0S3eH/Uy8
         kqQFdwzrz4MbY7EV2D4EontHOYmsUdijqtClDOxPVC+cWxIDFwYxvxjWSZ25gJR0SXjl
         jqGBZScV9bay7uNuH07z00qmqhqIVRnTOupdnwM/KGoU1023oBym9jAyEbKJJRlEReSR
         YILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695333199; x=1695937999;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKedUbEi3B4plTooYCB0IKgIV3PycN404RmnO3IuMFM=;
        b=nYL+dhJUPVjRxxfYcAAjuTlEbKQgK1o1iUUFNV44v0MGZle1UlmkMFXEAtk9QlDmxQ
         QQBYSQo5/fWy0Rdm2izQEpr9uv46PXsX2xdkvqqG5JL5sFiRT3xXL7OUMWu+aKyW5vr8
         avr6xjpe07eFAqfQWd7LBN/cvaIE5i4oDQnxJuwrkf/GHLGGYp1+V/U9xdLEyoyobwYh
         cZLnzn7DBZjzx47mpL0kZ2tLul19qQs3em3O5sUlU10LUZZhAY7fuj+oCZosNJCojHQi
         S7puaCrocPfssszzTKgngqjW3Z4UraN0ESPq0ekbnQ3VoDOYg6nuj0WsOJHYkfvZYVwO
         /lBw==
X-Gm-Message-State: AOJu0YwPRrc2TOYedHNwdgdIiWDjKlJkr5TXbtlBdy7ESP46Gh1JOt5X
	BIhj/sZ4XvpkvL2QQBhCYly1MUuUWl8=
X-Google-Smtp-Source: AGHT+IFzpB0LUmWG0P0jdo//QZ+1d5YUq5/bmYYJ0ADm2c6dVlI9n2014z9qeg4Uv/czKyKiUqWrALehVMY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:facd:b0:1c5:746f:efb3 with SMTP id
 ld13-20020a170902facd00b001c5746fefb3mr67381plb.9.1695333199087; Thu, 21 Sep
 2023 14:53:19 -0700 (PDT)
Date: Thu, 21 Sep 2023 14:53:17 -0700
In-Reply-To: <363c4ac28af93aa96a52f897d2fe5c7ec013f746.1695327124.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1695327124.git.isaku.yamahata@intel.com> <363c4ac28af93aa96a52f897d2fe5c7ec013f746.1695327124.git.isaku.yamahata@intel.com>
Message-ID: <ZQy7TcPZvpQ7ns5n@google.com>
Subject: Re: [RFC PATCH v2 4/6] KVM: gmem: Add ioctl to inject memory failure
 on guest memfd
From: Sean Christopherson <seanjc@google.com>
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Michael Roth <michael.roth@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Quentin Perret <qperret@google.com>, wei.w.wang@intel.com, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 21, 2023, isaku.yamahata@intel.com wrote:
> +	if (!pfn_valid(pfn))
> +		return -ENXIO;
> +	return memory_failure(pfn, MF_SW_SIMULATED);

memory_failure is defined iff CONFIG_MEMORY_FAILURE=y.  All of this code would
need to be conditioned on that (in addition to the injection configs).

address_space_operations.error_remove_page() arguably should be conditioned on
that as well, but that's a much bigger change and not a problem that needs to be
solved anytime soon.
