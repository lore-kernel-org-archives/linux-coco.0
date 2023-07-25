Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157CCC8C3
	for <linux-coco@lists.linux.dev>; Tue, 25 Jul 2023 12:39:26 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=wuzongyong@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0VoD7u7L_1690287822;
Received: from localhost(mailfrom:wuzongyong@linux.alibaba.com fp:SMTPD_---0VoD7u7L_1690287822)
          by smtp.aliyun-inc.com;
          Tue, 25 Jul 2023 20:23:43 +0800
Date: Tue, 25 Jul 2023 20:23:42 +0800
From: Wu Zongyong <wuzongyong@linux.alibaba.com>
To: linux-kernel@vger.kernel.org
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev
Subject: [Question] int3_selftest() generates a #UD instead of a #BP when
 create a SEV VM
Message-ID: <20230725122342.GA414477@L-PF27918B-1352.>
Reply-To: Wu Zongyong <wuzongyong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

Hi,

I try to boot a SEV VM (just SEV, no SEV-ES and no SEV-SNP) with a firmware written by myself.

But when the linux kernel executed the int3_selftest(), a #UD generated
instead of a #BP.

I'm curious how this happend. So I came here to ask for some here about
this problem. Is there some conditions that would make the int3
instruction generates a #UD?

BTW, it worked nomarlly with qemu and ovmf.

Any suggestion would be appreciated!

Thanks,
Wu Zongyong


