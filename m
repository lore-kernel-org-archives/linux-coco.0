Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2271FC5
	for <linux-coco@lists.linux.dev>; Fri,  3 Mar 2023 09:46:19 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id c18so1183260wmr.3
        for <linux-coco@lists.linux.dev>; Fri, 03 Mar 2023 01:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677836777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rlu8PtRZf5UJyL60KngpFOw4CS6fsjOoK7SRwFml2s4=;
        b=jLYJo7rXTiA42dbXtWsh8mOHcTggzfeyvoDhCfgisV8SCVTzw0rsOo/pCSkhghPFOH
         lWanw1LuX5ivAGsVHi7WWYYAJrRIOH/ZJIvYfOGVHEnTLcfE0HYWIyJtlzrlbTQC5FZL
         tqs1hWKCwMnJqVEgL68ihFtOLSuJg+0fv18dFG4sM6kCgeBVWdLp9pIrXsVySgTLiDPc
         AmCHQjQCn0kuweiW6dp1gmKh705jsKpfy1ZaEEIdjuUX97igkfh1ozASaD90+knpMrYf
         h+6lTlXPr9XE6zrNtkQyBFt1z2ERNMVlJ/UsQ/zbDc54QxU+xRzrBt+SRniNSmp5eeXV
         svrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677836777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rlu8PtRZf5UJyL60KngpFOw4CS6fsjOoK7SRwFml2s4=;
        b=0qIHQkCOXUyBEaUA+Oz7itLQafxnDKgVkN1+hY41ZA1/QxDx/5Cw6Im23TeE3fHInc
         abi6kEcc/c/rc87UBsVJ7NxZO2KkQ2nWkT7VMpTvE8I6UkdmRJrgmVIpKZjZ/R7h1pm/
         eKaYOTBl/Yn7zbVK8/dyMzOtCDSvASdVG+xzfm+/qmhSBthViuzHh91f4NbFEHnuZrAn
         0k9TfSYbfd1S3xyEwbR33K634Q4VXRMAm8FytYFzljYPvszMC/vVkWxm3DDT0zJDphRz
         zLRlmsOc/XmOQ4uonjoWspJ4SDkfqLZXpdRXJriYW23847jisDEWyjlqNqiuZY514o08
         ojNw==
X-Gm-Message-State: AO0yUKWit/FxfwG5gV9Ai8XCc5twJUu5EUrMOZXw9jYa3Q7skHsxxW23
	PjB8bZle1apY/Bn0i7B3rMhK0A==
X-Google-Smtp-Source: AK7set/cpnwjuX7fSaoNvFw6A/hbtKjeIM5Ymf/9/ZQ+x+h+WhBRCjZlZUxPJkws3AKcfOSMvtL2AA==
X-Received: by 2002:a05:600c:3506:b0:3dc:405b:99bf with SMTP id h6-20020a05600c350600b003dc405b99bfmr1095246wmq.15.1677836777678;
        Fri, 03 Mar 2023 01:46:17 -0800 (PST)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c425400b003dc47d458cdsm1921298wmm.15.2023.03.03.01.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 01:46:17 -0800 (PST)
Date: Fri, 3 Mar 2023 09:46:18 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Itaru Kitayama <itaru.kitayama@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, James Morse <james.morse@arm.com>,
	Joey Gouly <Joey.Gouly@arm.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Quentin Perret <qperret@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Steven Price <steven.price@arm.com>, Thomas Huth <thuth@redhat.com>,
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.cs.columbia.edu
Subject: Re: [RFC] Support for Arm CCA VMs on Linux
Message-ID: <20230303094618.GC361458@myrica>
References: <20230127112248.136810-1-suzuki.poulose@arm.com>
 <Y9PtKJ3Wicc19JF1@myrica>
 <CANW9uyud8RTkqgiL=64wV712QMxtAyubqeyCJ0vpcADJ42VqJA@mail.gmail.com>
 <Y/8Y3WLmiw6+Z5AS@myrica>
 <CANW9uysnvGCwANu+_6dp9+3rvHGOkThT9d0K2qpQV4exdmYWoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANW9uysnvGCwANu+_6dp9+3rvHGOkThT9d0K2qpQV4exdmYWoA@mail.gmail.com>

On Thu, Mar 02, 2023 at 07:12:24AM +0900, Itaru Kitayama wrote:
> > > I've tried your series in Real on CCA Host, but the KVM arch init
> > > emits an Invalid argument error and terminates.

This was the KVM_SET_ONE_REG for the SVE vector size. During my tests I
didn't enable SVE in the host but shrinkwrap enables more options.

Until we figure out support for SVE, disable it on the QEMU command-line
(similarly to '--disable-sve' needed for kvmtool boot):

	-cpu host,sve=off

Thanks,
Jean
